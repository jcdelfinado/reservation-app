package reservation.app

class Reservation {

    String guestName
    Date dateCreated
    Date checkIn
    Date checkOut

    static hasMany = [details: ReservationDetail]

    static constraints = {
        checkIn validator: {val->
            val >= new Date()
        }

    }
}
