
<%@ page import="reservation.app.Promo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'promo.label', default: 'Promo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-promo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-promo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list promo">
			
				<g:if test="${promoInstance?.discountedRate}">
				<li class="fieldcontain">
					<span id="discountedRate-label" class="property-label"><g:message code="promo.discountedRate.label" default="Discounted Rate" /></span>
					
						<span class="property-value" aria-labelledby="discountedRate-label"><g:fieldValue bean="${promoInstance}" field="discountedRate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${promoInstance?.saleEnd}">
				<li class="fieldcontain">
					<span id="saleEnd-label" class="property-label"><g:message code="promo.saleEnd.label" default="Sale End" /></span>
					
						<span class="property-value" aria-labelledby="saleEnd-label"><g:formatDate date="${promoInstance?.saleEnd}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${promoInstance?.reservationEnd}">
				<li class="fieldcontain">
					<span id="reservationEnd-label" class="property-label"><g:message code="promo.reservationEnd.label" default="Reservation End" /></span>
					
						<span class="property-value" aria-labelledby="reservationEnd-label"><g:formatDate date="${promoInstance?.reservationEnd}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${promoInstance?.reservationStart}">
				<li class="fieldcontain">
					<span id="reservationStart-label" class="property-label"><g:message code="promo.reservationStart.label" default="Reservation Start" /></span>
					
						<span class="property-value" aria-labelledby="reservationStart-label"><g:formatDate date="${promoInstance?.reservationStart}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${promoInstance?.saleStart}">
				<li class="fieldcontain">
					<span id="saleStart-label" class="property-label"><g:message code="promo.saleStart.label" default="Sale Start" /></span>
					
						<span class="property-value" aria-labelledby="saleStart-label"><g:formatDate date="${promoInstance?.saleStart}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:promoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${promoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
