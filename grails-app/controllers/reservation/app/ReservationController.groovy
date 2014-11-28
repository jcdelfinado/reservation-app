package reservation.app

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ReservationController {
    ReservationService reservationService
    static allowedMethods = [save: "POST", update: "PUT", delete: "hasOneDELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Reservation.list(params), model:[reservationInstanceCount: Reservation.count()]
    }

    def show(Reservation reservationInstance) {
        def list = ReservationDetail.where{
            reservation == reservationInstance
            status == "RESERVED"
        }
        println list
        respond reservationInstance, model:[reservationDetailList: list]
    }

    def details(){
        Date checkIn = params.date('checkIn', 'yyyy-MM-dd')
        Date checkOut = params.date('checkOut', 'yyyy-MM-dd')
        def roomList = reservationService.getAvailableRoomTypes(checkIn, checkOut)
        //def roomType = reservationService.getRoomTypes(roomList)
        render (view:'details', model:[checkIn:checkIn, checkOut:checkOut, guests:params.guests, roomList:roomList])
    }

    def confirm(){
        println "==============="
        println params
        println "================"
        def data = JSON.parse(params.data)
        println data
        println data.get(0)
        Date checkIn = new Date().parse('yyyy-MM-dd', data.checkIn);
        println checkIn
        Date checkOut = new Date().parse('yyyy-MM-dd', data.checkOut);
        def details = data.details
        def reservation = new Reservation(
                guestName: data.guestName,
                checkIn: checkIn,
                checkOut: checkOut,
                dateCreated: new Date()
        )
        println reservation.errors
        println "************"
        reservation.save flush: true
        println reservation.errors
        println "saved reservation"
        def status = reservationService.saveRooms(reservation.id, details, checkIn, checkOut)
        def message = (status == 200) ? "Your reservation has been booked." : "Sorry. There was something wrong booking your reservation."
        render text: message
    }

    def create() {
        respond new Reservation(params)
    }

    @Transactional
    def save(Reservation reservationInstance) {
        if (reservationInstance == null) {
            notFound()
            return
        }

        if (reservationInstance.hasErrors()) {
            respond reservationInstance.errors, view:'create'
            return
        }

        reservationInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'reservation.label', default: 'Reservation'), reservationInstance.id])
                redirect reservationInstance
            }
            '*' { respond reservationInstance, [status: CREATED] }
        }
    }

    def edit(Reservation reservationInstance) {
        respond reservationInstance
    }

    @Transactional
    def update(Reservation reservationInstance) {
        if (reservationInstance == null) {
            notFound()
            return
        }

        if (reservationInstance.hasErrors()) {
            respond reservationInstance.errors, view:'edit'
            return
        }

        reservationInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Reservation.label', default: 'Reservation'), reservationInstance.id])
                redirect reservationInstance
            }
            '*'{ respond reservationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Reservation reservationInstance) {

        if (reservationInstance == null) {
            notFound()
            return
        }

        reservationInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Reservation.label', default: 'Reservation'), reservationInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'reservation.label', default: 'Reservation'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
