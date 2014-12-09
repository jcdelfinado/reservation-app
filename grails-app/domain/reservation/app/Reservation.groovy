package reservation.app

class Reservation {

    String guestName
    Date dateCreated
    Date checkIn
    Date checkOut
    static hasMany = [details: ReservationDetail]

    static constraints = {
        checkIn validator: {val, obj, errors->
            if (val < new Date().clearTime())
                errors.rejectValue("checkIn", "invalidCheckIn")
        }
        checkOut validator: {val, obj, errors->
            if (val < obj.checkIn)
                errors.rejectValue("checkOut","invalidCheckout")
        }
    }

    void adjustCheckOut(){
        this.checkOut = ReservationDetail.createCriteria().list{
            eq "reservation", this
            eq "status", "RESERVED"
            order "date", "asc"
        }.last().date
        this.save flush: true
    }
}

