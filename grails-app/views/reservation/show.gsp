
<%@ page import="reservation.app.Reservation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reservation.label', default: 'Reservation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-reservation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-reservation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list reservation">
			
				<g:if test="${reservationInstance?.checkIn}">
				<li class="fieldcontain">
					<span id="checkIn-label" class="property-label"><g:message code="reservation.checkIn.label" default="Check In" /></span>
					
						<span class="property-value" aria-labelledby="checkIn-label"><g:formatDate date="${reservationInstance?.checkIn}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.checkOut}">
				<li class="fieldcontain">
					<span id="checkOut-label" class="property-label"><g:message code="reservation.checkOut.label" default="Check Out" /></span>
					
						<span class="property-value" aria-labelledby="checkOut-label"><g:formatDate date="${reservationInstance?.checkOut}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="reservation.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${reservationInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.guestName}">
				<li class="fieldcontain">
					<span id="guestName-label" class="property-label"><g:message code="reservation.guestName.label" default="Guest Name" /></span>
					
						<span class="property-value" aria-labelledby="guestName-label"><g:fieldValue bean="${reservationInstance}" field="guestName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:reservationInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${reservationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
