<%@ page import="reservation.app.Promo" %>



<div class="fieldcontain ${hasErrors(bean: promoInstance, field: 'discountedRate', 'error')} required">
	<label for="discountedRate">
		<g:message code="promo.discountedRate.label" default="Discounted Rate" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="discountedRate" value="${fieldValue(bean: promoInstance, field: 'discountedRate')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: promoInstance, field: 'saleEnd', 'error')} required">
	<label for="saleEnd">
		<g:message code="promo.saleEnd.label" default="Sale End" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="saleEnd" precision="day"  value="${promoInstance?.saleEnd}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: promoInstance, field: 'reservationEnd', 'error')} required">
	<label for="reservationEnd">
		<g:message code="promo.reservationEnd.label" default="Reservation End" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="reservationEnd" precision="day"  value="${promoInstance?.reservationEnd}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: promoInstance, field: 'reservationStart', 'error')} required">
	<label for="reservationStart">
		<g:message code="promo.reservationStart.label" default="Reservation Start" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="reservationStart" precision="day"  value="${promoInstance?.reservationStart}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: promoInstance, field: 'saleStart', 'error')} required">
	<label for="saleStart">
		<g:message code="promo.saleStart.label" default="Sale Start" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="saleStart" precision="day"  value="${promoInstance?.saleStart}"  />

</div>

