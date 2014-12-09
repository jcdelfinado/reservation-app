package reservation.app

import grails.transaction.Transactional

import javax.xml.bind.ValidationException

@Transactional
class ReservationService {

    List<Room> getReservedRooms(Date checkIn, Date checkOut){
       ReservationDetail.createCriteria().list{
            eq "status", "RESERVED"
            between "date", checkIn, checkOut
            projections{
                property "room"
            }
        }
    }

    List<RoomType> getAvailableRoomTypes(Date checkIn, Date checkOut){
        List<Room> reservedRooms = getReservedRooms(checkIn, checkOut)
        Room.createCriteria().listDistinct{
            eq "isAvailable", true
            not {
                'in' ("id", reservedRooms.id)
            }
            projections {
                property 'type'
            }
        }
    }

    void saveReservationDetails(Reservation reservationInstance, String roomType){
        Room room = getAvailableRoomsOfThisType(roomType,
                getReservedRooms(reservationInstance.checkIn, reservationInstance.checkOut)).pop()
        for (currentDate in (reservationInstance.checkIn..reservationInstance.checkOut)){
            ReservationDetail reservationDetail = new ReservationDetail(
                    reservation: reservationInstance,
                    date: currentDate,
                    status: "RESERVED",
                    room: room,
                    rate: room.type.defaultRate
            )
            if (!reservationDetail.validate()){
                throw new ValidationException("Reservation details could not be saved")
            }
            //feels like save shouldn't happen here. add to list in a command object then iterate at save?
            reservationDetail.save flush: true

        }
    }

    List<Room> getAvailableRoomsOfThisType(String roomType, List<Room> reservedRooms){
        //this should return at least one room
        //if null, a room was reserved while processing. race problem. how do we catch this?
        List<Room> rooms = Room.createCriteria().list{
            eq "isAvailable", true
            type {
                eq "name", roomType
            }
            not {
                'in' ("id", reservedRooms.id)
            }
        }
        if (!rooms.size()){
            throw new Exception("No rooms available")
        } else {
            return rooms
        }
    }

    void cancelDetails(Date date, Reservation reservationInstance){
        getReservationDetailsByDate(date, reservationInstance).each {
            if (it.save (flush: true)) println "CANCELLED"
        }
    }

    List<ReservationDetail> getReservationDetailsByDate(Date date, Reservation reservationInstance){
        ReservationDetail.createCriteria().list{
            eq "date", date
            eq "reservation", reservationInstance
        }
    }
}
