package reservation.app

class ReservationDetail {

    Date date
    BigDecimal rate
    String status

    static belongsTo = ['room', Room]

    static constraints = {
        rate min: 0
        status inList: ['COMPLETED', 'CANCELLED', 'RESERVED']
    }
}
