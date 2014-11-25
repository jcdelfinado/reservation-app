package reservation.app

class Room {

    String number
    boolean isAvailable

    static belongsTo = ['type':RoomType]

    static constraints = {
        number unique:true
    }

    static mappings = {
    }
}
