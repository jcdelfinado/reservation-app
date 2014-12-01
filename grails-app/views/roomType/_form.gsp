<%@ page import="reservation.app.RoomType" %>



<div class="form-group ${hasErrors(bean: roomTypeInstance, field: 'defaultRate', 'error')} required">
	<label class="control-label" for="defaultRate">
		<g:message code="roomType.defaultRate.label" default="Default Rate" />
		<span class="required-indicator">*</span>
	</label>
	<g:field class="form-control" name="defaultRate" value="${fieldValue(bean: roomTypeInstance, field: 'defaultRate')}" required=""/>

</div>

<div class="form-group ${hasErrors(bean: roomTypeInstance, field: 'capacity', 'error')} required">
	<label class="control-label" for="capacity">
		<g:message code="roomType.capacity.label" default="Capacity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field class="form-control" name="capacity" type="number" min="0" value="${roomTypeInstance.capacity}" required=""/>

</div>

<div class="form-group ${hasErrors(bean: roomTypeInstance, field: 'description', 'error')} required">
	<label class="control-label" for="description">
		<g:message code="roomType.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="description" required="" value="${roomTypeInstance?.description}"/>

</div>

<div class="form-group ${hasErrors(bean: roomTypeInstance, field: 'name', 'error')} required">
	<label class="control-label" for="name">
		<g:message code="roomType.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="name" required="" value="${roomTypeInstance?.name}"/>

</div>

<div class="form-group ${hasErrors(bean: roomTypeInstance, field: 'photo', 'error')} required">
	<label class="control-label" for="photo">
		<g:message code="roomType.photo.label" default="Photo" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="photo" name="photo" />

</div>

