/**
 * Created by jcdelfinado on 11/27/14.
 */
var total = 0;
var details = {};
$('#confirmation-form').on('submit', function(e){
    e.preventDefault();
    var data = {};
    $.each($(this).serializeArray(), function(){
        data[this.name] = this.value;
    });
    data.details = details;
    console.log($.param(data));
    $.post('confirm', {
        data: JSON.stringify(data),
        success: function(data){
            console.log("YEY!");
        }
    });
});




function updateSummary(type, num) {
    console.log ('looking for '+'#' + type.attr('id') + '-summary')
    if (!$('#' + type.attr('id') + '-summary').length && num > 0) {
        console.log('no summary found. creating one.')
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

    if (num <= 0) delete details[type.attr('id')];
    else details[type.attr('id')] = num;

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