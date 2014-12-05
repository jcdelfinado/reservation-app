package reservation.app

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ReservationController {
    ReservationService reservationService
    static allowedMethods = [save: "POST", update: "PUT", delete: "hasOneDELETE", cancel: "DELETE"]

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
        respond reservationInstance, model:[reservationDetailList: list, reservationDateList: dates]
    }

    def add(){
        render view: "details"
    }

    def cancel(Reservation reservationInstance){
        if (reservationService){
            Date date = params.date('date', 'dd MMM yyyy');
            reservationService.cancelDetails(date, reservationInstance)
            reservationService.adjustReservationCheckOut(reservationInstance)
            flash.message = "Reservation for ${params.date} successfully cancelled."
            redirect action: 'edit', id: reservationInstance.id
        }
    }

    def details(){
        if (params.checkIn && params.checkOut) {
            Date checkIn = params.date('checkIn', 'MM/dd/yyyy')
            Date checkOut = params.date('checkOut', 'MM/dd/yyyy')

            def availableRoomTypes = reservationService.getAvailableRoomTypes(checkIn, checkOut)
            render(view: 'details', model: [checkIn: checkIn, checkOut: checkOut, guests: params.guests, availableRoomTypes: availableRoomTypes])
        }
    }

    def confirm(){
        Date checkIn = new Date().parse('MM/dd/yyyy', params.checkIn);
        Date checkOut = new Date().parse('MM/dd/yyyy', params.checkOut);
        Reservation reservation = new Reservation(
                guestName: params.guestName,
                checkIn: checkIn,
                checkOut: checkOut,
                dateCreated: new Date()
        )

        if (!reservation.validate()) {
            if (reservation.errors.hasFieldErrors("checkIn")) {
                flash.errors = [message(code: 'invalid.checkIn', args: [formatDate(format: "dd MMM yyyy", date: checkIn)])]
            }
            if (reservation.errors.hasFieldErrors("checkOut")) {
                flash.errors.push(message(code: 'invalid.checkOut', args: [formatDate(format: "dd MMM yyyy", date: checkOut)]))
            }
            return redirect(action: "details", controller: "reservation", params: [checkIn: params.checkIn, checkOut: params.checkOut, guests: params.guests])
        }
        reservation.save()
        log.info("Reservation saved. Persist suspended.")
        try {
            reservationService.saveReservationDetails(reservation, (String)params.roomType)
            reservation.save flush: true
            flash.message = "Your reservation was successfully booked!"
        } catch (e){
            flash.errors = (flash.errors) ? flash.errors.push(e.message) : [e.message]
            return redirect(action:"details", controller:"reservation", params: [checkIn:params.checkIn, checkOut:params.checkOut, guests:params.guests])
        }
        redirect(url: "/")
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
