package reservation.app

import grails.validation.Validateable
import org.grails.databinding.BindingFormat
import grails.validation.ValidationException

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

    def details(AvailabilityCommand availabilityCommand){
        if (!availabilityCommand.hasErrors()) {
            List<RoomType> availableRoomTypes = reservationService.getAvailableRoomTypes(availabilityCommand.checkIn,
                    availabilityCommand.checkOut)
            render(view: 'details',
                    model: [availabilityCmd: availabilityCommand, availableRoomTypes: availableRoomTypes])
        } else {
            render(view: 'details', model: [availabilityCmd: availabilityCommand])
        }
    }

    def confirm(ConfirmationCommand confirmationCommand){
        try {
            confirmationCommand.save()
            flash.message = "Your reservation was successfully booked!"
            redirect controller: "reservation", action: "show", id: confirmationCommand.reservationInstance.id
        } catch (e){
            flash.errors = [e.message]
            redirect action: "details", controller: "reservation",
                    params: [checkIn:params.checkIn, checkOut:params.checkOut, guests:params.guests]
        }
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

@Validateable
class AvailabilityCommand{
    @BindingFormat('MM/dd/yyyy')
    Date checkIn
    @BindingFormat('MM/dd/yyyy')
    Date checkOut
    int guests

    static constraints = {
        checkIn validator: {val, obj, errors->
            if (val < new Date().clearTime())
                errors.rejectValue("checkIn", "invalidCheckIn")
        }
        checkOut validator: {val, obj, errors->
            if (val < obj.checkIn)
                errors.rejectValue("checkOut","invalidCheckout")
        }
    }
}
@Validateable
class ConfirmationCommand{
    ReservationService reservationService
    @BindingFormat('MM/dd/yyyy')
    Date checkIn
    @BindingFormat('MM/dd/yyyy')
    Date checkOut
    String guestName
    String roomType
    int guests
    Reservation reservationInstance

    static constraints = {
        reservationInstance nullable: true
        checkIn validator: {val, obj, errors->
            if (val < new Date().clearTime())
                errors.rejectValue("checkIn", "invalidCheckIn")
        }
        checkOut validator: {val, obj, errors->
            if (val < obj.checkIn)
                errors.rejectValue("checkOut","invalidCheckout")
        }
    }
    /**
     * Saves the reservation and reservation details
     * @throws Validation Exception if the reservation isn't valid
     * @throws Exception if saving Reservation Details fail
     * @return Instance of saved Reservation
     */
    Reservation save(){
        this.reservationInstance = new Reservation(
                guestName: this.guestName,
                checkIn: this.checkIn,
                checkOut: this.checkOut,
                dateCreated: new Date()
        ).save()
        if (this.reservationInstance.validate()) {
            this.reservationService.saveReservationDetails(this.reservationInstance, this.roomType)
            this.reservationInstance.save(flush: true)
        } else
            throw new ValidationException("The reservation has invalid details.", this.reservationInstance.errors)
    }
}