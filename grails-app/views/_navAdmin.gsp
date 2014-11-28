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

                <li class="navbar-collapse">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="glyphicon glyphicon-tower color-picker"></span> Rooms
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/reservation-app/room/create"><span class="glyphicon glyphicon-plus-sign text-primary"></span> Add Room</a></li>
                        <li><a href><span class="glyphicon glyphicon-pushpin text-primary"></span> Room Reserved</a></li>
                        <li><a href><span class="glyphicon glyphicon-star text-primary"></span> Promo Rates</a></li>
                    </ul>
                </li>

                <li class="navbar-collapse">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="glyphicon glyphicon-check color-picker"></span> Reservations
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/reservation-app/room/create"><span class="glyphicon glyphicon-plus-sign text-primary"></span> Add Reservation</a></li>
                        <li><a href><span class="glyphicon glyphicon-pushpin text-primary"></span> Room Reserved</a></li>
                        <li><a href><span class="glyphicon glyphicon-star text-primary"></span> Promo Rates</a></li>
                    </ul>
                </li>
                <li><a href>
                    <g:form name="logout" controller="logout" method="POST">
                        <button><span class="glyphicon glyphicon-log-out"></span> Log out</button>
                    </g:form>
                </a> </li>

                %{--<div  id="user">Welcome | <sec:loggedInUserInfo field="username"></sec:loggedInUserInfo></div>--}%
            </ul>
        </div> <!--End of Navbar-left-->

    </div>

</nav>