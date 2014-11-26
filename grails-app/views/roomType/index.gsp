
<%@ page import="reservation.app.RoomType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'roomType.label', default: 'RoomType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-roomType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-roomType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="defaultRate" title="${message(code: 'roomType.defaultRate.label', default: 'Default Rate')}" />
					
						<g:sortableColumn property="capacity" title="${message(code: 'roomType.capacity.label', default: 'Capacity')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'roomType.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'roomType.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="photo" title="${message(code: 'roomType.photo.label', default: 'Photo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${roomTypeInstanceList}" status="i" var="roomTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${roomTypeInstance.id}">${fieldValue(bean: roomTypeInstance, field: "defaultRate")}</g:link></td>
					
						<td>${fieldValue(bean: roomTypeInstance, field: "capacity")}</td>
					
						<td>${fieldValue(bean: roomTypeInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: roomTypeInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: roomTypeInstance, field: "photo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${roomTypeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
