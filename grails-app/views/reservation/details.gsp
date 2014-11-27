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
<g:javascript src="details.js"/>
</body>
</html>