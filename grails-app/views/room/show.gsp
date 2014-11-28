
<%@ page import="reservation.app.Room" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'room.label', default: 'Room')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<g:render template="/navAdmin"/>
	<div class="center-block">
		<div class="container">
			<div class="col-md-4 col-md-offset-4">
				<div id="show-room" class="content scaffold-show" role="main">
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
						<g:if test="${flash.message}">
					<div class="alert alert-success" role="status">${flash.message}</div>
				</g:if>

					<table class="table table-bordered container-fluid">
						<thead>
						<th>Room Number</th>
						<th>Available</th>
						<th>Room Type</th>
						</thead>
						<tbody>
					<g:if test="${roomInstance?.number}">
				<td>
					%{--<span id="number-label" class="property-label"><g:message code="room.number.label" default="Room Number" /></span>--}%
						<span class="property-value" aria-labelledby="number-label"><g:fieldValue bean="${roomInstance}" field="number"/></span>
				</td>
				</g:if>
			
				<g:if test="${roomInstance?.isAvailable}">
				<td>
					%{--<span id="isAvailable-label" class="property-label"><g:message code="room.isAvailable.label" default="Available" /></span>--}%
						<span class="property-value" aria-labelledby="isAvailable-label"><g:formatBoolean boolean="${roomInstance?.isAvailable}" /></span>
				</td>
				</g:if>
			
				<g:if test="${roomInstance?.type}">
				<td>
					%{--<span id="type-label" class="property-label"><g:message code="room.type.label" default="Room Type" /></span>--}%
						<span class="property-value" aria-labelledby="type-label"><g:link controller="roomType" action="show" id="${roomInstance?.type?.id}">${roomInstance?.type?.encodeAsHTML()}</g:link></span>
				</td>
				</g:if>
			</tbody>

				</table>
			<g:form url="[resource:roomInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="btn btn-primary" action="edit" resource="${roomInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>

				</div>
			</div>
		</div>
	</div>

		</div>
	</body>
</html>
