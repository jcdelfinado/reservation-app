package reservation.app



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PromoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Promo.list(params), model:[promoInstanceCount: Promo.count()]
    }

    def show(Promo promoInstance) {
        respond promoInstance
    }

    def create() {
        respond new Promo(params)
    }

    @Transactional
    def save(Promo promoInstance) {
        if (promoInstance == null) {
            notFound()
            return
        }

        if (promoInstance.hasErrors()) {
            respond promoInstance.errors, view:'create'
            return
        }

        promoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'promo.label', default: 'Promo'), promoInstance.id])
                redirect promoInstance
            }
            '*' { respond promoInstance, [status: CREATED] }
        }
    }

    def edit(Promo promoInstance) {
        respond promoInstance
    }

    @Transactional
    def update(Promo promoInstance) {
        if (promoInstance == null) {
            notFound()
            return
        }

        if (promoInstance.hasErrors()) {
            respond promoInstance.errors, view:'edit'
            return
        }

        promoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Promo.label', default: 'Promo'), promoInstance.id])
                redirect promoInstance
            }
            '*'{ respond promoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Promo promoInstance) {

        if (promoInstance == null) {
            notFound()
            return
        }

        promoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Promo.label', default: 'Promo'), promoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'promo.label', default: 'Promo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
