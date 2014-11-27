package reservation.app

import grails.converters.JSON
import grails.gorm.DetachedCriteria
import grails.transaction.Transactional

import java.lang.reflect.Array

@Transactional
class ReservationService {

    def getReservedRooms(Date start, Date end){
        new DetachedCriteria(ReservationDetail).list{
            eq "status", "RESERVED"
            between "date", start, end
            projections{
                property "room"
            }
        }
    }
    def getAvailableRoomTypes(Date start, Date end){
        def reserved = getReservedRooms(start, end)
        def criteria = Room.createCriteria()
        def availableTypes = criteria.listDistinct{
            eq "isAvailable", true
            not {
                'in' ("id", reserved.id)
            }
            projections {
                property 'type'
            }
        }
        for (type in availableTypes){
            type.availableCount = Room.createCriteria().list {
                eq "type", type
                eq "isAvailable", true
                not {
                    'in'("id", reserved.id)
                }
            }.size()
        }
        return availableTypes
    } // end of getAvailableRoomTypes

    def getAvailableRoomsOfThisType(typeId, Date start, Date end){
        def reserved = getReservedRooms(start, end)
        def criteria = Room.createCriteria()
        def availableRooms = criteria.list{
            eq "isAvailable", true
            type{
                eq "id", (Long) typeId
            }
            not {
                'in' ("id", reserved.id)
            }
        }
    }

    def saveReservationDetail(id, rooms, num, Date date){
        println "saving details..."
        def count = 0
        for (index in [0..num]){
            def room = rooms[index]
            println "saving " + room
            def detail = new ReservationDetail(
                    reservation: Reservation.get(id),
                    room: room,
                    date: date,
                    rate: room.type.defaultRate,
                    status: "RESERVED"
            )
        }
    }

    void saveRooms(id, details, Date checkIn, Date checkOut){
        Date current = checkIn
        println "we're trying to save..."
        println checkOut
        println current
        println current.before(checkOut)
        while (current.before(checkOut)){
            println "current date: " + current
            println details.get('2')
            details.each { type, count ->
                def rooms = getAvailableRoomsOfThisType(type, checkIn, checkOut)
                println "availableRooms: " + rooms.size()
                if (rooms.size() <= count) {
                    println "count: " + count
                    saveReservationDetail(id, rooms, count, current)
                }
                else println "Oops. First come, first served."
            }
            current = current + 1;
        }
        println "exiting"
    }
}
