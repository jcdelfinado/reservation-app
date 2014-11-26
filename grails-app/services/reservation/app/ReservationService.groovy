package reservation.app

import grails.gorm.DetachedCriteria
import grails.transaction.Transactional

import java.lang.reflect.Array

@Transactional
class ReservationService {

    def getAvailableRooms(Date start, Date end){
        def reserved = new DetachedCriteria(ReservationDetail).list{
            eq "status", "RESERVED"
            between "date", start, end
            projections{
                property "room"
            }
        }
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
    } // end of getAvailableRooms

    /*def getRoomTypes(ArrayList<Room> rooms){
        for (room in rooms){
            room.
        }
    }*/
}
