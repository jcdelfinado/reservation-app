package reservation.app

class RoomCreateTagLib {

    def roomField = { attrs, body ->
        def action = attrs.remove("action")

        if ("create".equals(action)) {
            out <<"<input "
            attrs.each { k, v ->
                out << k << "=\"" << v << "\" "
            }
            out << "/>"
        } else {
            out << """<input """
            attrs.each { k, v ->
                out << k << "=\"" << v << "\" "
            }
            out << "/>"
        }
    }
}