modules = {
    application {
        resource url:'js/application.js'
    }

    'data-table' {
        dependsOn 'bootstrap'
        dependsOn 'jquery'
        resource url: 'http://cdn.datatables.net/plug-ins/9dcbecd42ad/integration/bootstrap/3/dataTables.bootstrap.css'
        resource url: 'js/jquery.dataTables.js'
        resource url: 'http://cdn.datatables.net/plug-ins/9dcbecd42ad/integration/bootstrap/3/dataTables.bootstrap.js'

    }

    'app-index' {
        dependsOn 'bootstrap'
        dependsOn 'jquery-ui'
        resource url: 'js/index.js'
    }

}