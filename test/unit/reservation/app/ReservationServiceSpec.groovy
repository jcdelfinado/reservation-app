package reservation.app

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(ReservationService)
@Mock([Reservation, Room, RoomType, ReservationDetail])
class ReservationServiceSpec extends Specification {

    void "getReservedRooms returns correct number of reserved rooms"() {
        given: "We have these rooms and reservation"
            Reservation reservationInstance = new Reservation(
                    guestName: "Test",
                    checkIn: new Date().clearTime(),
                    checkOut: new Date().clearTime()+2
            ).save()
            Room room = new Room(
                    number: "A01",
                    isAvailable: true,
                    type: new RoomType(name: "Twin", description: "Test", defaultRate: 10.00, photoUrl: "test.jpg")
            ).save()

        when:"Reservation details is populated"
            //List<ReservationDetail> reservationDetails = []
            for (date in (reservationInstance.checkIn .. reservationInstance.checkOut)){
                new ReservationDetail(
                        room: room,
                        date: date,
                        rate: room.type.defaultRate,
                        reservation: reservationInstance,
                        status: "RESERVED"
                ).save()
            }

        then:"We have correct number of reserved rooms"
            assert service.getReservedRooms(reservationInstance.checkIn, reservationInstance.checkOut).size() == 3


    }

}

