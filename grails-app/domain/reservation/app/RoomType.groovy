package reservation.app

class RoomType {

    String name
    String description
    int capacity
    BigDecimal defaultRate

    static constraints = {
        defaultRate min: 0.0G
        capacity min: 0I

    }
}
