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

    void saveReservationDetails(Reservation reservationInstance, String roomType, Date checkIn, Date checkOut){
        for (currentDate in (checkIn..checkOut)){
            Room room = getAvailableRoomOfThisType(roomType, getReservedRooms(checkIn, checkOut))
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

    Room getAvailableRoomOfThisType(String roomType, List<Room> reservedRooms){
        //this should return at least one room
        //if null, a room was reserved while processing. race problem. how do catch this?
        List<Room> rooms = Room.createCriteria().list{
            eq "isAvailable", true
            eq "type", roomType
            not {
                'in' ("id", reservedRooms.id)
            }
            maxResults 1
        }
        println rooms
        if (!rooms.size()){
            throw new Exception("No rooms available")
        } else {
            return rooms.get(0)
        }
    }

    void cancelDetails(Date date, Reservation reservationInstance){
        getReservationDetailsByDate(date, reservationInstance).each {
            it.status = "CANCELLED"
        }
    }

    void adjustReservationCheckOut(Reservation reservationInstance){
        reservationInstance.checkOut = ReservationDetail.createCriteria().list{
            eq "reservation", reservationInstance
        }.last().date
        reservationInstance.save flush: true
    }

    List<ReservationDetail> getReservationDetailsByDate(Date date, Reservation reservationInstance){
        ReservationDetail.createCriteria().list{
            eq "date", date
            eq "reservation", reservationInstance
        }
    }
}
