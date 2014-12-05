<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <div class="navbar-brand">
                Welcome | <sec:loggedInUserInfo field="username"></sec:loggedInUserInfo>
            </div>
        </div>
        <div class="navbar-left">
            <ul class="nav navbar-nav">
                <li><a href="/reservation-app/room"><span class="glyphicon glyphicon-home"></span> Home</a></li>
                <li >
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="glyphicon glyphicon-tower color-picker"></span> Rooms
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/reservation-app/room/create"><span class="glyphicon glyphicon-plus text-primary"></span> Add Room</a></li>
                        <li><a href="/reservation-app/roomType/create"><span class="glyphicon glyphicon-plus-sign text-primary"></span> Add Room Type</a></li>
                        <li><a href="/reservation-app/room/index"><span class="glyphicon glyphicon-list text-primary"></span> Room List</a></li>
                        <li><a href="/reservation-app/roomType/index"><span class="glyphicon glyphicon-list text-primary"></span> Room Type List</a></li>
                    </ul>
                </li>

                <li>
                    <a href="${createLink(controller: 'reservation')}">
                        <span class="glyphicon glyphicon-check color-picker"></span> Reservations
                    </a>
                </li>
                <li>
                    <a href>
                        <span class="glyphicon glyphicon-star color-picker"></span> Promos
                    </a>
                </li>
                <li>
                    <a href>
                    <g:form name="logout" controller="logout" method="POST">
                        <button><span class="glyphicon glyphicon-log-out"></span> Log out</button>
                    </g:form>
                     </a>
                </li>
            </ul>
        </div> <!--End of Navbar-left-->

    </div>

</nav>