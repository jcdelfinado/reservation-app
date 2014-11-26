package reservation.app



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RoomTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RoomType.list(params), model:[roomTypeInstanceCount: RoomType.count()]
    }

    def show(RoomType roomTypeInstance) {
        respond roomTypeInstance
    }

    def create() {
        respond new RoomType(params)
    }

    @Transactional
    def save(RoomType roomTypeInstance) {
        if (roomTypeInstance == null) {
            notFound()
            return
        }

        if (roomTypeInstance.hasErrors()) {
            respond roomTypeInstance.errors, view:'create'
            return
        }

        roomTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'roomType.label', default: 'RoomType'), roomTypeInstance.id])
                redirect roomTypeInstance
            }
            '*' { respond roomTypeInstance, [status: CREATED] }
        }
    }

    def edit(RoomType roomTypeInstance) {
        respond roomTypeInstance
    }

    @Transactional
    def update(RoomType roomTypeInstance) {
        if (roomTypeInstance == null) {
            notFound()
            return
        }

        if (roomTypeInstance.hasErrors()) {
            respond roomTypeInstance.errors, view:'edit'
            return
        }

        roomTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'RoomType.label', default: 'RoomType'), roomTypeInstance.id])
                redirect roomTypeInstance
            }
            '*'{ respond roomTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(RoomType roomTypeInstance) {

        if (roomTypeInstance == null) {
            notFound()
            return
        }

        roomTypeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'RoomType.label', default: 'RoomType'), roomTypeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'roomType.label', default: 'RoomType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
