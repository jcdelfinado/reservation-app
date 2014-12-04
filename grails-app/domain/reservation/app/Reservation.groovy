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
                errors.rejectValue("checkIn", "invalid")
        }
        checkOut validator: {val, obj, errors->
            println (val <= obj.checkIn || val<= new Date())
            if (val <= obj.checkIn || val<= new Date())
                errors.rejectValue("checkOut", "invalid")
        }
    }
}

