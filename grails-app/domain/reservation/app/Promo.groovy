package reservation.app

class Promo {

    Date saleStart
    Date saleEnd
    Date reservationStart
    Date reservationEnd
    BigDecimal discountedRate

    static belongsTo = ['room', Room]

    static constraints = {
       discountedRate min :0.0G
        saleEnd validator: {val, obj ->
            val >= obj.saleStart
        }
        reservationEnd validator: {val, obj ->
            val >= obj.reservationStart
        }
    }
}
