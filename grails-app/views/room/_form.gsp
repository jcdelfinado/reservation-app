<%@ page import="reservation.app.Room" %>



<div class="form-group ${hasErrors(bean: roomInstance, field: 'number', 'error')} required">
		<label class="control-label" for="number">
			<g:message class="form-control" code="room.number.label" default="Number" />
			<span class="required-indicator"></span>
		</label>
		<g:textField id="room-number"class="form-control" name="number" required="" value="${roomInstance?.number}"/>

</div>

<div class="form-group ${hasErrors(bean: roomInstance, field: 'type', 'error')} required">
	<label class="control-label" for="type">
		<g:message code="room.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select class="form-control" id="type" name="type.id" from="${reservation.app.RoomType.list()}" optionKey="id" required="" value="${roomInstance?.type?.id}"/>

</div>

<div style="margin-left:20px;" class="form-group ${hasErrors(bean: roomInstance, field: 'isAvailable', 'error')}">
	<label class="checkbox" for="isAvailable">
		<g:checkBox id="available" class="checkbox-inline"  name="isAvailable" value="${roomInstance?.isAvailable}" />
		<g:message code="room.isAvailable.label" default="Available" />
	</label>
</div>

