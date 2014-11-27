<%--
  Created by IntelliJ IDEA.
  User: rens
  Date: 11/25/14
  Time: 6:03 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
    <link type="text/css" href="${resource(dir: 'css', file: 'details.css')}" rel="stylesheet"/>
</head>

<body>
    <g:render template="/nav"/>
    <div class="container">
    <g:render template="availabilityHorizontalForm" model="['checkIn':checkIn, 'checkOut':checkOut,'guests':guests]"/>
        <div class="available-rooms col-md-8">
            <g:each in="${roomList}" var="roomType">
                <g:render template="/roomType/availabilityStub" model="['roomType':roomType]"/>
            </g:each>
        </div>
        <fieldset class="reservation-details col-md-4">
            <legend>Reservation Summary</legend>
            <div class="reservation-summary">
                <h4 class="pull-left">Total: </h4><span class="pull-right" id="total"></span>
                <table class="table" data-toggle="table">
                    <thead>
                        <th class="col-md-2">Qty</th>
                        <th class="col-md-4">Room</th>
                        <th class="col-md-6" data-field="price" data-halign="right" data-align="right">Price</th>
                    </thead>
                    <tbody id="summary-table-body" class="summary-table">
                    </tbody>
                </table>
                <button class="btn btn-primary col-md-12" data-toggle="modal" data-target="#confirmation-modal" id="submit-booking" disabled>Book this reservation now!</button>
                <g:render template="confirmationModal"/>
            </div>
        </fieldset>
    </div>
    <r:script>
        var total = 0;
        function updateSummary(type, num) {
            console.log ('looking for '+'#' + type.attr('id') + '-summary')
            if (!$('#' + type.attr('id') + '-summary').length && num > 0) {
                console.log('no summary found')
                $('#summary-table-body').append(newSummaryItem(type, num));
            }
            else {
                if (num <= 0) {
                    $('#' + type.attr('id') + '-summary').remove();
                } else {
                    $('#' + type.attr('id') + '-qty').text(num);
                    $('#' + type.attr('id') + '-price').text((num.toFixed(2)*parseFloat(type.data('price'))).toFixed(2));
                }
            }
            total = 0
            $('.summary-price-indicator').each(function(item){
                total = parseFloat(total) + parseFloat($(this).text());
            });
            $('#total').text(total.toFixed(2));
            if (total <= 0){
                $('#submit-booking').attr('disabled', true);
            }else $('#submit-booking').attr('disabled', false);
        };

        function newSummaryItem(type, num) {
            var row = $('<tr/>', {
                id: type.attr('id') + '-summary',
                addClass: 'summary-row'
            });
            var qty = $('<td/>', {
                id: type.attr('id') + '-qty',
                text: num
            });
            var name = $('<td/>', {
                id: type.attr('id') + '-name',
                text: type.data('name')
            });
            var price = $('<td/>', {
                id: type.attr('id') + '-price',
                text: type.data('price'),
                addClass: 'summary-price-indicator'
            });
            row.append(qty);
            row.append(name);
            row.append(price);
            return row;
        };
        $('.btn-spinner').on('click', function () {
            var target = $($(this).data('target'));
            var num = parseInt(target.text()), newNum;
            if ($(this).data('action') == 'add' && num < parseInt(target.data('max'))) {
                target.text(newNum = num + 1);
            }
            if ($(this).data('action') == 'subtract' && num > 0) {
                target.text(newNum = num - 1);
            }
            console.log('clicked')
            updateSummary(target, newNum);
        });
    </r:script>
</body>
</html>