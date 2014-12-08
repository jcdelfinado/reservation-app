package reservation.app

class Reservation {

    String guestName
    Date dateCreated
    Date checkIn
    Date checkOut
    static hasMany = [details: ReservationDetail]

    static constraints = {
        checkIn validator: {val, obj, errors->

            if (val <= new Date())
                errors.rejectValue("checkIn", "invalidCheckIn")

        }
        checkOut validator: {val, obj, errors->
            val >= obj.checkIn
            errors.rejectValue("checkOut","invalidCheckout")

        }
    }

}

