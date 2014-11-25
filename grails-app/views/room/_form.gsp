<%@ page import="reservation.app.Room" %>



<div class="fieldcontain ${hasErrors(bean: roomInstance, field: 'number', 'error')} required">
	<label for="number">
		<g:message code="room.number.label" default="Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="number" required="" value="${roomInstance?.number}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: roomInstance, field: 'isAvailable', 'error')} ">
	<label for="isAvailable">
		<g:message code="room.isAvailable.label" default="Is Available" />
		
	</label>
	<g:checkBox name="isAvailable" value="${roomInstance?.isAvailable}" />

</div>

<div class="fieldcontain ${hasErrors(bean: roomInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="room.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="type" name="type.id" from="${reservation.app.RoomType.list()}" optionKey="id" required="" value="${roomInstance?.type?.id}" class="many-to-one"/>

</div>

