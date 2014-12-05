<%@ page import="reservation.app.Reservation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reservation.label', default: 'Reservation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<r:require module="data-table"/>
	</head>
	<body>
		<g:render template="/navAdmin"/>
		<div class="container">
			<div class="clearfix">
				<h3>${reservationInstance.guestName}'s Reservation</h3>
				<p class="help-block">
					from <b>${formatDate(format: 'MMM dd yyyy', date: reservationInstance.checkIn)}</b> to
					to <b>${formatDate(format: 'MMM dd yyyy', date: reservationInstance.checkOut)}</b>
					| booked on ${formatDate(format: 'MMM-dd-yyyy, hh:mm a', date: reservationInstance.dateCreated)}
				</p>

				<g:if test="${flash.message}">
					<div class="alert alert-success" role="status">${flash.message}</div>
				</g:if>
				<fieldset>
					<g:link resource="${reservationInstance}" action="edit">Edit this reservation</g:link>
				</fieldset>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<legend>Reservation Dates</legend>
					<div class="list-group">
						<g:each in="${reservationDateList}" status="i" var="date">
							<a class="list-group-item hand-pointed date-list-item" data-date="${formatDate(format:"dd MMM yyyy", date:date)}">
								${formatDate(format:"dd MMM yyyy", date:date)}
							</a>
						</g:each>
					</div>
				</div>
			</div>

			<div class="col-md-9">
				<legend>Reserved Rooms for <span id="date-label" data-default="the whole duration">whole duration</span></legend>
				<a id="show-all" class="hand-pointed disabled pull-right">Show rooms for whole duration</a>
				<table class="table" id="rooms-table">
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
							<td>${formatDate(format: 'dd MMM yyyy', date: detail.date)}</td>
							<td>${detail.room}</td>
							<td>${detail.room.type}</td>
							<td>${detail.status}</td>
							<td>${detail.rate}</td>
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
		</div>
	<g:javascript>
		$(document).ready(function() {
			$('#rooms-table').dataTable();

			$('.date-list-item').on('click', function(){
				var table = $('#rooms-table').DataTable();
				table.column(0).search('^'+$(this).data('date')+'$', true, false).draw();
				$('#date-label').text($(this).data('date'));
				$('#show-all').removeClass('disabled');
			});
			$('#show-all').on('click', function(){
				var table = $('#rooms-table').DataTable();
				table.column(0).search('').draw();
				$('#date-label').text('whole duration');
				$(this).addClass('disabled');
			});
		} );
	</g:javascript>
	</body>
</html>
