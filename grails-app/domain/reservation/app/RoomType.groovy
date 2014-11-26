package reservation.app

class RoomType {

    String name
    String description
    String photoUrl
    int capacity
    BigDecimal defaultRate
    int availableCount



    static transients = ['availableCount']
    static constraints = {
        defaultRate min: 0.0G
        capacity min: 0I

    }

    @Override
    String toString(){
        this.name
    }
}
