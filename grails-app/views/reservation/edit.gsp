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
	<div class="modal fade" id="cancel-modal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body  clearfix">
					<g:form resource="${reservationInstance}" action="cancel" method="DELETE">
						<h4>Are you sure you want to cancel this reservation?</h4>
						<p class="help-block">Date selected <b><span id="cancel-date-label"></span></b></p>
						<input type="hidden" id="hidden-date" name="date"/>
						<fieldset class="pull-right">
							<button class="btn btn-default" type="button" data-dismiss="modal">No</button>
							<button class="btn btn-primary" type="submit">Yes</button>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
	<g:javascript>
		$(document).ready(function() {
			$('#rooms-table').dataTable();

			$('.date-list-item').on('click', function(){
				var table = $('#rooms-table').DataTable();
				table.column(3).search('^'+$(this).data('date')+'$', true, false).draw();
				$('#date-label').text($(this).data('date'));
			});

			$('.cancel-btn').on('click', function(){
				var parent = $(this).parent();
				var date = parent.data('date');
				var detailId = $('#hidden-id').val();
				$('#cancel-date-label').text(date);
				$('#hidden-date').val(date);
				$('#cancel-modal').modal('show');
			});

			%{--$('#cancel-confirm').on('click', function(){
				var date = parent.data('date');
				var detailId = $('#hidden-id').val();
				$.ajax('${createLink(controller: 'reservation', action: 'cancel')}'+'/'+detailId, {
					data: { date: date },
					type: "DELETE",
					success: function()
				});
			});--}%
		} );
	</g:javascript>
	</body>
</html>
