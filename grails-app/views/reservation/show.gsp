
<%@ page import="reservation.app.Reservation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reservation.label', default: 'Reservation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/navAdmin"/>
		<div class="container">
			<h3>${reservationInstance.guestName}'s Reservation</h3>
			<p class="help-block">
				from <b>${formatDate(format: 'MMM-dd-yyyy', date: reservationInstance.checkIn)}</b> to
				to <b>${formatDate(format: 'MMM-dd-yyyy', date: reservationInstance.checkOut)}</b>
				| booked on ${formatDate(format: 'MMM-dd-yyyy, hh:mm a', date: reservationInstance.dateCreated)}
			</p>
			<g:if test="${flash.message}">
				<div class="alert" role="status">${flash.message}</div>
			</g:if>

			<table class="table">
				<thead>
					<th class="col-md-2">Date</th>
					<th class="col-md-2">Room Number</th>
					<th class="col-md-2">Type</th>
					<th class="col-md-4">Status</th>
					<th class="col-md-2">Rate</th>
				</thead>
				<tbody>
					<g:each in="${reservationDetailList}" var="detail">
						<tr>
							<td>${formatDate(format: 'MMM dd yyyy', date: detail.date)}</td>
							<td>${detail.room}</td>
							<td>${detail.room.type}</td>
							<td>${detail.status}</td>
							<td>${detail.rate}</td>
						</tr>
					</g:each>
				</tbody>
			</table>

			<g:form url="[resource:reservationInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${reservationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
