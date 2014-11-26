
<%@ page import="reservation.app.RoomType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'roomType.label', default: 'RoomType')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-roomType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-roomType" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list roomType">
			
				<g:if test="${roomTypeInstance?.defaultRate}">
				<li class="fieldcontain">
					<span id="defaultRate-label" class="property-label"><g:message code="roomType.defaultRate.label" default="Default Rate" /></span>
					
						<span class="property-value" aria-labelledby="defaultRate-label"><g:fieldValue bean="${roomTypeInstance}" field="defaultRate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${roomTypeInstance?.capacity}">
				<li class="fieldcontain">
					<span id="capacity-label" class="property-label"><g:message code="roomType.capacity.label" default="Capacity" /></span>
					
						<span class="property-value" aria-labelledby="capacity-label"><g:fieldValue bean="${roomTypeInstance}" field="capacity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${roomTypeInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="roomType.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${roomTypeInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${roomTypeInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="roomType.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${roomTypeInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${roomTypeInstance?.photo}">
				<li class="fieldcontain">
					<span id="photo-label" class="property-label"><g:message code="roomType.photo.label" default="Photo" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:roomTypeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${roomTypeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
