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
            order("date", "asc")
        }
        def dates = ReservationDetail.createCriteria().list{
            eq 'reservation', reservationInstance
            eq 'status', "RESERVED"
            order "date", "asc"
            projections {
                property "date"
            }
        }.unique()
        println list
        respond reservationInstance, model:[reservationDetailList: list, reservationDateList: dates]
    }

    def add(){
        println "going to details instead"
        render view: "details"
    }

    def details(){
        if (params.checkIn && params.checkOut) {
            Date checkIn = params.date('checkIn', 'yyyy-MM-dd')
            Date checkOut = params.date('checkOut', 'yyyy-MM-dd')
            def roomList = reservationService.getAvailableRoomTypes(checkIn, checkOut)
            //def roomType = reservationService.getRoomTypes(roomList)
            render(view: 'details', model: [checkIn: checkIn, checkOut: checkOut, guests: params.guests, roomList: roomList])
        }
    }

    def confirm(){
        def data = JSON.parse(params.data)
        Date checkIn = new Date().parse('yyyy-MM-dd', data.checkIn);
        Date checkOut = new Date().parse('yyyy-MM-dd', data.checkOut);
        def details = data.details
        def reservation = new Reservation(
                guestName: data.guestName,
                checkIn: checkIn,
                checkOut: checkOut,
                dateCreated: new Date()
        )
        println reservation.errors
        reservation.save()
        println reservation.errors
        println "saved reservation"
        def status = reservationService.saveRooms(reservation.id, details, checkIn, checkOut)
        def message = "Sorry. There was something wrong booking your reservation. Please try again."
        if (status == 200){
            message = "Your reservation has been booked."
            reservation.save flush: true
        }
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
        def list = ReservationDetail.where{
            reservation == reservationInstance
            status == "RESERVED"
            order("date", "asc")
        }
        def dates = ReservationDetail.createCriteria().list{
            eq 'reservation', reservationInstance
            eq 'status', "RESERVED"
            order "date", "asc"
            projections {
                property "date"
            }
        }.unique()
        respond reservationInstance, model:[reservationDetailList: list, reservationDateList: dates]
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
