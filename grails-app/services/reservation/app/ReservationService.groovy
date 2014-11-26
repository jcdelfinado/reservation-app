package reservation.app

import grails.gorm.DetachedCriteria
import grails.transaction.Transactional

import java.lang.reflect.Array

@Transactional
class ReservationService {

    def getAvailableRooms(Date start, Date end){
        def detached = new DetachedCriteria(ReservationDetail).list{
            eq "status", "RESERVED"
            between "date", start, end
            projections{
                property "room"
            }
        }
        println "**RESERVATIONS**"
        println ReservationDetail.list()
        println detached

        def criteria = Room.createCriteria()
        def availableRooms = criteria.listDistinct{
            eq "isAvailable", true
            not {
                'in' ("id", detached.id)
            }
            projections {
                property 'type'
            }
        }
    } // end of getAvailableRooms

    /*def getRoomTypes(ArrayList<Room> rooms){
        for (room in rooms){
            room.
        }
    }*/
}
