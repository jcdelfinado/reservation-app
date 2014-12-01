
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
		<div class="col-md-12">
		<div id="list-roomType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<br/>
					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
					<table class="table table-bordered" id="dataTablesList">
					<thead>
							<tr>

								<g:sortableColumn property="photo" title="${message(code: 'roomType.photo.label', default: 'Photo')}" />

								<g:sortableColumn property="defaultRate" title="${message(code: 'roomType.defaultRate.label', default: 'Default Rate')}" />

								<g:sortableColumn property="capacity" title="${message(code: 'roomType.capacity.label', default: 'Capacity')}" />

								<g:sortableColumn property="name" title="${message(code: 'roomType.name.label', default: 'Room Type')}" />

								<g:sortableColumn property="description" title="${message(code: 'roomType.description.label', default: 'Description')}" />

							</tr>
						</thead>
						<tbody>
						<g:each in="${roomTypeInstanceList}" status="i" var="roomTypeInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

								%{--<td>${fieldValue(bean: roomTypeInstance, field: "photoUrl")}</td>--}%
							<td><r:img file="${roomTypeInstance?.photoUrl}" style="height:120px; width: 170px;"/> </td>

								<td><g:link action="show" id="${roomTypeInstance.id}">${fieldValue(bean: roomTypeInstance, field: "defaultRate")}</g:link></td>

								<td>${fieldValue(bean: roomTypeInstance, field: "capacity")}</td>

								<td>${fieldValue(bean: roomTypeInstance, field: "description")}</td>

								<td>${fieldValue(bean: roomTypeInstance, field: "name")}</td>



							</tr>
						</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${roomTypeInstanceCount ?: 0}" />
					</div>
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
