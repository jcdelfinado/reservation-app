/**
 * Created by rens on 12/4/14.
 */
$('.carousel').carousel();
$('#checkIn-field').datepicker({
    formatDate: 'mm/dd/yyyy',
    minDate: new Date(),
    onSelect: function(){
        $('#checkOut-field').attr('disabled', false);
        $('#checkOut-field').datepicker("option", "minDate", $(this).datepicker("getDate"));
    }
});
$('#checkOut-field').datepicker({
    formatDate: 'mm/dd/yyyy'
});


