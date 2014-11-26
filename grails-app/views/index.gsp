<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
	</head>
	<body>
		<nav class="navbar navbar-default">
			<div class="container">
				<div class="navbar-header">
					<div class="navbar-brand">Some Hotel</div>
				</div>
				<div class="navbar-left">
					<ul class="nav navbar-nav">
						<li class="active"><a href>Home</a></li>
						<li><a href>Rooms</a></li>
						<li><a href>Events</a></li>
						<li><a href>Contact</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="banner-container">
			<g:render template="/reservation/reservationFront"/>
			<div id="banner" class="carousel slide" data-ride="carousel" data-interval="3000">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#banner" data-slide-to="0" class="active"></li>
					<li data-target="#banner" data-slide-to="1"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<r:img file="slide1.jpg"/>

					</div>
					<div class="item">
						<r:img file="slide2.jpg"/>
					</div>
				</div>
			</div>
		</div>
		<r:script>
			$('.carousel').carousel();
		</r:script>
	</body>
</html>
