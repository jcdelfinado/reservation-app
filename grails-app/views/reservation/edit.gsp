<%@ page import="reservation.app.Reservation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reservation.label', default: 'Reservation')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<r:require module="data-table"/>

	</head>
	<body>
		<g:render template="/navAdmin"/>
		<div class="container">
			<div id="edit-reservation" class="content scaffold-edit" role="main">
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<g:hasErrors bean="${reservationInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${reservationInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</g:hasErrors>
				<g:form class="col-md-12" url="[resource:reservationInstance, action:'update']" method="PUT" >
					<g:hiddenField name="version" value="${reservationInstance?.version}" />
					<fieldset class="form">
						<g:render template="form"/>
					</fieldset>
					<fieldset class="buttons">

					</fieldset>
				</g:form>
			</div>
		</div>
	<g:javascript>
		$(document).ready(function() {
			$('#rooms-table').dataTable();

			$('.date-list-item').on('click', function(){
				var table = $('#rooms-table').DataTable()
				table.column(3)
						.search('^'+$(this).data('date')+'$', true, false).draw();
			});
		} );
	</g:javascript>
	</body>
</html>
