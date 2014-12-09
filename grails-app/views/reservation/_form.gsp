<%@ page import="reservation.app.Reservation" %>
<div class="col-md-4">
	<div class="form-group">
		<label for="guestName" class="control-label">
			<g:message code="reservation.guestName.label" default="Guest Name" />
		</label>
		<div class="input-group">
			<g:textField  class="form-control" name="guestName" required="" value="${reservationInstance?.guestName}"/>
			<div class="input-group-btn">
				<button class="btn btn-primary pull-right">Save</button>
			</div>
		</div>
	</div>


	<div class="form-group">
		<legend>Reservation Dates</legend>
		<div class="list-group">

			<g:each in="${reservationDateList}" status="i" var="date">
				<a class="list-group-item hand-pointed date-list-item" data-date="${formatDate(format:"MM/dd/yyyy", date:date)}">
					<g:if test="${i == reservationDateList.size()-1}">
						<button class="glyphicon glyphicon-remove pull-right cancel-btn" type="button"
								data-toggle="tooltip" data-placement="left" title="Cancel this booking date"></button>
					</g:if>
					${formatDate(format:"MM/dd/yyyy", date:date)}
				</a>
			</g:each>
		</div>
	</div>
</div>

<div class="col-md-8">
	<legend>Reserved Rooms for <span id="date-label" data-default="the whole duration">the whole duration</span></legend>
	<a id="show-all" class="hand-pointed disabled pull-right">Show rooms for whole duration</a>
	<table class="table" id="rooms-table">
		<thead>
			<th>Room Number</th>
			<th>Type</th>
			<th>Rate</th>
			<th>Date</th>
		</thead>
		<tbody>
			<g:each in="${reservationDetailList}" var="detail">
				<tr>
					<td>${detail?.room}</td>
					<td>${detail?.room.type}</td>
					<td>${detail?.rate}</td>
					<td>${formatDate(format:"MM/dd/yyyy", date:detail.date)}</td>
				</tr>
			</g:each>
		</tbody>
	</table>
</div>


