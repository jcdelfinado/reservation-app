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


    }//end

    void "Check available RoomType"(){
        given: "There are two room types"
            Reservation reservationInstance = new Reservation(
                    guestName: "Test",
                    checkIn: new Date().clearTime(),
                    checkOut: new Date().clearTime()+2
            ).save()

            RoomType rt1 = new RoomType(
                    name: "Twin",
                    description: "Test",
                    defaultRate: 10.12,
                    photoUrl: "test.jpg"
            ).save()

            RoomType rt2 = new RoomType(
                    name: "Deluxe",
                    description: "test",
                    defaultRate: 12.0,
                    photoUrl: "test.jpg"
            ).save()
            Room room = new Room(
                    number: "A01",
                    isAvailable: true,
                    type: rt1
            ).save()
            new Room(
                    number: "A02",
                    isAvailable: true,
                    type: rt2
            ).save()

        when: "One room type is fully booked" //how to fully book a room type?
            //a reservation detail must exist where the room has this room type
           /* Room room = new Room( number: "A01", isAvailable: true, type: rt1 ).save()*/
           new ReservationDetail(
                    room: room,
                    date:reservationInstance.checkIn..reservationInstance.checkOut,
                    rate: room.type.defaultRate,
                    reservation: reservationInstance,
                    status: "RESERVED"
            ).save()
 /*           println ReservationDetail.list()
            println Reservation.list()
            println RoomType.list()*/
        then: "One room type should be returned"
       /* assert service.getReservedRooms(reservationInstance.checkIn, reservationInstance.checkOut).size() == 3*/
        assert service.getAvailableRoomTypes(reservationInstance.checkIn, reservationInstance.checkOut).size() == 1
        assert service.getAvailableRoomTypes(reservationInstance.checkIn, reservationInstance.checkOut).get(0) != rt1

    }

        void "Check if reservation is save"(){
            given: "there are one room to reserved"
            Reservation reservationInstance = new Reservation(
                    guestName: "Test",
                    checkIn: new Date().clearTime(),
                    checkOut: new Date().clearTime()+2,
            ).save()
            RoomType rt1 = new RoomType(
                    name: "Twin",
                    description: "TESTPO",
                    defaultRate: 12.00,
                    photoUrl: "test.jpg"
            ).save()

            new Room(
                    number:"A02",
                    isAvailable: true,
                    type: rt1
            ).save()

            when: "The room name is Twin"
          /*  new ReservationDetail(
                    room: room,
                    date: new Date().clearTime(),
                    rate: room.type.defaultRate,
                    reservation: reservationInstance,
                    status: "RESERVED"
            ).save()*/
            service.saveReservationDetails(reservationInstance, "Twin")
            then: "It will count how many room were save"
            assert ReservationDetail.count() == 3

    }

}

