<%@ page import="reservation.app.Reservation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reservation.label', default: 'Reservation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/navAdmin"/>
		<div class="container">
			<h3>Reservations</h3>
			<table class="table table-hover">
				<thead>
					<th>Guest Name</th>
					<th>Check In</th>
					<th>Check Out</th>
					<th>Date Created</th>
				</thead>
				<tbody>
					<g:each in="${reservationInstanceList}" status="i" var="reservation">
						<tr class="hand-pointed reservation-row" data-id="${reservation.id}}">
							<td>${reservation.guestName}</td>
							<td>${formatDate(format: 'MMM-dd-yyyy', date: reservation.checkIn)}</td>
							<td>${formatDate(format: 'MMM-dd-yyyy', date: reservation.checkOut)}</td>
							<td>${formatDate(format: 'MMM-dd-yyyy, hh:mm a', date: reservation.dateCreated)}</td>
						</tr>
					</g:each>
				</tbody>
			</table>
		</div>
		<r:script>
			$('.reservation-row').on('click', function(){
				window.location.assign('/reservation-app/reservation/show/' + parseInt($(this).data('id')));
			});
		</r:script>
	</body>
</html>
