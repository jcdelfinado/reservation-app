<%@ page import="reservation.app.Room" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'room.label', default: 'Room')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/navAdmin"/>
		<div id="list-room" class="content scaffold-list" role="main">
		<div class="container">
			<div class="col-md-12">
			<h1>Room List</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
				<br/>
				<table class="table table-bordered container-fluid">
					<div class=" add contrainer">
						<div class="navbar-left">
							<a href="/reservation-app/room/create.gsp">
								<span class="glyphicon glyphicon-plus"></span>Add Room
							</a>
						</div>
						<div class="navbar-right fa-align-right">
							<input class="cm-searching col-md-11"/>
						</div>
					</div>
					<thead>
						<th>Room Number</th>
						<th>Availability</th>
						<th>Room Type</th>
						<th>Action</th>
							<!--<tr>
								<g:sortableColumn property="number" title="${message(code: 'room.number.label', default: 'Number')}" />

								<g:sortableColumn property="isAvailable" title="${message(code: 'room.isAvailable.label', default: 'Is Available')}" />

								<th><g:message code="room.type.label" default="Type" /></th>
							</tr>-->
						</thead>
						<tbody>
						<g:each in="${roomInstanceList}" status="i" var="roomInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

								<td><g:link action="show" id="${roomInstance.id}">${fieldValue(bean: roomInstance, field: "number")}</g:link></td>

								<td><g:formatBoolean boolean="${roomInstance.isAvailable}" /></td>

								<td>${fieldValue(bean: roomInstance, field: "type")}</td>

								<td><a href class="edit-btn" data-target="#myModal" data-toggle="modal"
										data-number = "${roomInstance.number}"
										data-isAvailable = "${roomInstance.isAvailable}"
										data-type="${roomInstance.type}">
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
					<div class="modal-body">
						<form class="container-fluid">

							<label>Room Number</label><br>

							<input type="text" id="room-number" name="number" value="${fieldValue(bean: roomInstance, field: "number")}"><br><br>

							<label>Availability</label><br>
							<input type="checkbox" id="isAvailable" name="isAvailable" class="input-xlarge" value=""><br><br>

							<label>Room Type</label><br>
							<input type="text" id="type" name="type" class="input-xlarge"><br><br>

						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save changes</button>
					</div>
				</div>
			</div>

			<!--END OF MODAL-->
			<!--Start of Jscript-->

			<!--jscript-->



		</div>
		<r:script>
			$(document).ready(function(){
				$('.edit-btn').on('click', function(){
					$('#room-number').val($(this).data('number'));
				});
			});
		</r:script>
	</body>
</html>
