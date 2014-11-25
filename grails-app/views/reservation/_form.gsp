<%@ page import="reservation.app.Reservation" %>



<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'checkIn', 'error')} required">
	<label for="checkIn">
		<g:message code="reservation.checkIn.label" default="Check In" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="checkIn" precision="day"  value="${reservationInstance?.checkIn}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'checkOut', 'error')} required">
	<label for="checkOut">
		<g:message code="reservation.checkOut.label" default="Check Out" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="checkOut" precision="day"  value="${reservationInstance?.checkOut}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'guestName', 'error')} required">
	<label for="guestName">
		<g:message code="reservation.guestName.label" default="Guest Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="guestName" required="" value="${reservationInstance?.guestName}"/>

</div>

