/**
 * Created by jcdelfinado on 11/27/14.
 */
function setRoomType(type){
    $('#room-type-indicator').text(type);
    $('input[name="roomType"]').val(type);
}

function setPrice(price){
    $('#price').text(price);
}

$('.room-type-stub').click(function(){
    if ($(this).hasClass('selected')){
        $(this).removeClass('selected').children('.panel-hover').fadeOut(200);
        setPrice('0.00');
        setRoomType('None');
        $('#submit-booking').attr('disabled', true);
        return
    }
    $('.selected').removeClass('selected').children('.panel-hover').fadeOut(200);
    $(this).addClass('selected');
    setRoomType($(this).data('room-type'));
    setPrice($(this).data('price'));
    $('#submit-booking').attr('disabled', false);
});

$('.room-type-stub').hover(
    function(){
        $($(this).children('.panel-hover')).fadeIn(200);
    },
    function(){
        if (!$(this).hasClass('selected'))
            $($(this).children('.panel-hover')).fadeOut(200);
    });
