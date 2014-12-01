<%@ page import="reservation.app.Room" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
	<head>
		<meta name="layout" content="dataTable">
		<r:require module="data-table"/>
		<g:set var="entityName" value="${message(code: 'room.label', default: 'Room')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/navAdmin"/>
		<div id="list-room" class="content scaffold-list" role="main">
		<div class="container">
			<h1>Room List</h1>
					<a href="/reservation-app/room/create">
						<span class="glyphicon glyphicon-plus"></span>Add Room
					</a>
				<br/>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<br/>
				<table class="table table-bordered" id="dataTablesList">
					<thead>
						<th>Room Number</th>
						<th>Available</th>
						<th>Room Type</th>
						<th>Action</th>
					</thead>
						<tbody>
						<g:each in="${roomInstanceList}" status="i" var="roomInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

								<td><g:link action="show" id="${roomInstance.id}">${fieldValue(bean: roomInstance, field: "number")}</g:link></td>

								<td><g:formatBoolean boolean="${roomInstance.isAvailable}" /></td>

								<td>${fieldValue(bean: roomInstance, field: "type")}</td>

								<td><a href class="edit-btn" data-target="#myModal" data-toggle="modal"
										data-number = "${roomInstance.number}"
										data-available = "${roomInstance.isAvailable}"
										data-type="${roomInstance.type.id}"
										data-id="${roomInstance.id}">

									<span class="glyphicon glyphicon-edit"></span> Edit
									</a>
								</td>
							</tr>
						</g:each>
						</tbody>
					</table>
			</div>
		</div><!--end of class container-->

		<!-- EDIT modal-->
		%{--<g:each in="${roomInstanceList}" status="i" var="roomInstance">--}%
		<div id="myModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">Edit Room Details</h4>
					</div>
					<div class="modal-body clearfix">
						<div class="col-md-4">
					<g:form name="modal-save" method="PUT" >
						<g:render template="form"/>
					</g:form>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button form="modal-save" type="submit" class="btn btn-primary">Save changes</button>
						%{--<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />--}%

					</div>

				</div>
			</div>
		</div>
		<!--END OF MODAL-->
		<!--Start of Jscript-->
		<r:script>
			$(document).ready(function(){
				$('.edit-btn').on('click', function(){
					$('#room-number').val($(this).data('number'));
					$('#available').prop('checked', $(this).data('available'));
					$('#type').val($(this).data('type'));
					$('#modal-save').attr('action', "${createLink(controller: "room", action: "update")}/" +$(this).data('id'))
					console.log($('#modal-save').serialize());

				});
			});
		</r:script>
		<!--jscript-->

		%{--	start of data tables--}%

		<g:javascript>
			$(document).ready(function() {
				$("#dataTablesList").dataTable();
			});
		</g:javascript>
		%{--end of data tables--}%


	 </body>
</html>
