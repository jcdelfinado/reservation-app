<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
	</head>
	<body>
		<g:render template="/nav"/>
		<div class="banner-container">
			<div class="reservation-form col-md-4">
				<h2>Book Now!</h2>
				<g:render template="/reservation/reservationFront"/>
			</div>
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
