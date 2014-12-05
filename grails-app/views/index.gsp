<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title></title>
		<link type="text/css" href="${resource(dir: 'css', file: 'index.css')}" rel="stylesheet"/>
		<r:require module="app-index"/>
	</head>
	<body>
		<g:render template="/nav"/>

	<g:if test="${flash.message}">
		<div class="alert alert-success">
			<button class="glyphicon glyphicon-remove pull-right" data-dismiss="alert"></button>
			${flash.message}
		</div>
	</g:if>



	<g:if test="${flash.errors}">
		<g:each in="${flash.errors}" var="error">
			<div class="alert alert-danger">
				<button class="glyphicon glyphicon-remove pull-right" data-dismiss="alert"></button>
				<b>Oops! </b>${error}
			</div>
		</g:each>
	</g:if>


		<div class="banner-container">
			<div class="reservation-form col-md-4">
				<h2>Book Now!</h2>
				<g:render template="/reservation/availabilityVerticalForm"/>
			</div>
			<div id="banner" class="carousel slide" data-ride="carousel" data-interval="3000">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#banner" data-slide-to="0" class="active"></li>
					<li data-target="#banner" data-slide-to="1"></li>
					<li data-target="#banner" data-slide-to="2"></li>
					<li data-target="#banner" data-slide-to="3"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<r:img file="slide1.jpg" width="100%"/>
					</div>
					<div class="item">
						<r:img file="slide2.jpg" width="100%"/>
					</div>
					<div class="item">
						<r:img file="slide3.jpg" width="100%"/>
					</div>
					<div class="item">
						<r:img file="slide4.jpg" width="100%"/>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
