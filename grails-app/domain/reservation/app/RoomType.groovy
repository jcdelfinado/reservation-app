package reservation.app

class RoomType {

    String name
    String description
    String photoUrl
    int capacity
    BigDecimal defaultRate




    static constraints = {
        defaultRate min: 0.0G
        capacity min: 0I

    }

    @Override
    String toString(){
        this.name
    }
}
