package reservation.app

class RoomType {

    String name
    String description
    int capacity
    BigDecimal defaultRate

    static constraints = {
        defaultRate min: 0
        capacity min: 0
    }
}
