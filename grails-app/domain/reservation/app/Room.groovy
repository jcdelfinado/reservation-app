package reservation.app

class Room {


    String number
    boolean isAvailable

    static belongsTo = [type:RoomType]
    static hasMany = [reservationDetail: ReservationDetail]
    static constraints = {
        number unique:true
    }

    static mappings = {
    }

    @Override
    String toString(){
        this.number
    }
}
