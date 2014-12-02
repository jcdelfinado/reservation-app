
<%@ page import="reservation.app.RoomType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="dataTable">
		<r:require module="data-table"/>
		<g:set var="entityName" value="${message(code: 'roomType.label', default: 'RoomType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<g:render template="/navAdmin"/>
	<div class="container">
		<div id="list-roomType" class="content scaffold-list" role="main">
			<h1 style="margin-top: -10px;"><g:message code="default.list.label" args="[entityName]" /></h1>

			<g:link class="btn btn-primary" style="margin-bottom: 10px;" action="create" resource="${roomInstance}">
				<g:message code="default.button.add.label" default="Add Room Type"  />
			</g:link>

					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>

					<table class="table table-bordered" id="dataTablesList">
					<thead>
							<tr>
								<thead>
									<th>Photo</th>
								    <th>Room Type</th>
									<th>Capacity</th>
									<th>Default Rate</th>
									<th>Description</th>
								</thead>
							</tr>
						</thead>
						<tbody>
						<g:each in="${roomTypeInstanceList}" status="i" var="roomTypeInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							%{--<g:link action="show" id="${roomTypeInstance.id}"></g:link>--}%
							<td><r:img file="${roomTypeInstance?.photoUrl}" style="height:120px; width: 170px;"/> </td>

								<td><g:link action="show" id="${roomTypeInstance.id}">${fieldValue(bean: roomTypeInstance, field: "name")}</g:link></td>

								<td>${fieldValue(bean: roomTypeInstance, field: "capacity")}</td>

								<td>${fieldValue(bean: roomTypeInstance, field: "defaultRate")}</td>

								<td>${fieldValue(bean: roomTypeInstance, field: "description")}</td>

							</tr>
						</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${roomTypeInstanceCount ?: 0}" />
					</div>
			</div>

	</div>
	<g:javascript>
		$(document).ready(function() {
			$("#dataTablesList").dataTable();
		});
	</g:javascript>
	%{--end of data tables--}%
	</body>
</html>
