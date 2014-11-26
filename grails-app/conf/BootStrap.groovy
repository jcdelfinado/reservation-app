import reservation.app.RoomType
import reservation.app.Room

class BootStrap {

    def init = { servletContext ->
        new RoomType(
                name: "Twin",
                description: "Two beds, one bathroom, cable TV, and WiFi",
                capacity: 2,
                defaultRate: 1200.00,
                photoUrl: "rooms/twin.jpg"
        ).save()
        new RoomType(

                name: "Deluxe",
                description: "One King-size bed, one bathroom, cable TV, and WiFi",
                capacity: 4,
                defaultRate: 2000.00,
                photoUrl: "rooms/deluxe.jpg"
        ).save()
        new RoomType(
                name: "Penthouse",
                description: "One King-size bed, two twin beds, two bathrooms, patio, cable TV, and WiFi",
                capacity: 4,
                defaultRate: 5000.00,
                photoUrl: "rooms/penthouse.jpg"
        ).save()

        new Room(
                number: "A01",
                type: RoomType.get(1),
                isAvailable: true
        ).save()
        new Room(
                number: "A02",
                type: RoomType.get(1),
                isAvailable: true
        ).save()
        new Room(
                number: "A03",
                type: RoomType.get(1),
                isAvailable: true
        ).save()
        new Room(
                number: "B01",
                type: RoomType.get(2),
                isAvailable: true
        ).save()
        new Room(
                number: "B02",
                type: RoomType.get(2),
                isAvailable: true
        ).save()
        new Room(
                number: "B03",
                type: RoomType.get(2),
                isAvailable: true
        ).save()
        new Room(
                number: "C01",
                type: RoomType.get(3),
                isAvailable: true
        ).save()
    }
    def destroy = {
    }
}
