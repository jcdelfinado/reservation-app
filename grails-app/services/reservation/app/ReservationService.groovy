package reservation.app

import grails.converters.JSON
import grails.gorm.DetachedCriteria
import grails.transaction.Transactional

import java.lang.reflect.Array

@Transactional
class ReservationService {

    List<Room> getReservedRooms(Date start, Date end){
        ReservationDetail.withCriteria{
            eq "status", "RESERVED"
            between "date", start, end
            projections{
                property "room"
            }
        }
    }

    def removeDetails(Date date, Reservation reservationInstance){
        def details = getDetails(date, reservationInstance)
        for (detail in details){
            detail.delete flush: true
        }
    }

    def adjustReservation(Reservation reservationInstance){
        def last = getDetails(reservationInstance).last().date
        reservationInstance.checkOut = last
        reservationInstance.save flush: true
    }

    def getDetails(Reservation reservationInstance){
        def details = ReservationDetail.createCriteria().list{
            eq "reservation", reservationInstance
        }
    }

    def getDetails(Date date, Reservation reservationInstance){
        def details = ReservationDetail.createCriteria().list{
            eq "date", date
            eq "reservation", reservationInstance
        }
    }

    def getAvailableRoomTypes(Date start, Date end){

//        List<Room> reservedRooms = getReservedRooms(start, end)
//
//        Room.createCriteria().listDistinct{
//            eq "isAvailable", true
//            not {
//                'in' ("id", reservedRooms.id)
//            }
//            projections {
//                property 'type'
//            }
//        }

        Map<Room, List<ReservationDetail>> reservationDetailsByRoom = ReservationDetail.withCriteria {
            eq 'status', 'AVAILABLE'
            between 'date', start, end
            groupProperty 'room'
        }

        List<Room> rooms = reservationDetailsByRoom.keySet().toList()
        List<Room> availableRooms = rooms.findAll{ Room room ->

            List<ReservationDetail> details = reservationDetailsByRoom[room]

            //if reservation details are available from start until end
            details.date == (start..end).toList()
        }

    } // end of getAvailableRoomTypes

    List<Room> getAvailableRoomsOfThisType(typeId, Date start, Date end){
        println "getting rooms of type " + typeId

        def reserved = getReservedRooms(start, end)

        Room.withCriteria{
            eq "isAvailable", true
            type{
                eq "id", typeId
            }
            not {
                'in' ("id", reserved.id)
            }
        }
    }

    def saveReservationDetail(id, rooms, num, Date date){
        println "saving details..."
        def count = 0
        for (index in [0..num-1]){
            def room = rooms[index]
            println "saving " + room
            def detail = new ReservationDetail(
                    reservation: Reservation.get(id),
                    room: room,
                    date: date,
                    rate: room.type.defaultRate,
                    status: "RESERVED"
            )
            detail.save flush: true
        }
    }

    int saveRooms(id, details, Date checkIn, Date checkOut){

        for (key in details.keys()){
            print "details: "
            println details
            Date current = checkIn
            println "we're trying to save..."
            println checkOut
            println current
            def rooms = getAvailableRoomsOfThisType(key.toLong(), checkIn, checkOut)
            println "availableRooms: " + rooms.size()
            println "needed rooms: " + details.get(key)
            while (current.before(checkOut) || !current.compareTo(checkOut)){
                println "current date: " + current
                if (rooms.size() >= details.get(key)) {
                    println "count: " + details.get(key)
                    saveReservationDetail(id, rooms, details.get(key), current)
                }
                else {
                    println "Oops. First come, first served."
                    return 500
                }
                current = current + 1;
            }
        }
        return 200
    }
}
