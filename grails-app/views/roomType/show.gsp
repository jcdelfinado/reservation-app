
<%@ page import="reservation.app.RoomType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'roomType.label', default: 'RoomType')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/navAdmin"/>
	<div class="center-block">
		<div class="container">
			<div class="col-md-12">
					<div id="show-roomType" class="content scaffold-show" role="main">
						<h1><g:message code="default.show.label" args="[entityName]" /></h1>
						<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
						</g:if>

						<table class="table table-hover">
							<thead>
							<th>Photo</th>
							<th>Room Rate</th>
							<th>Room Capacity</th>
							<th>Room Type</th>
							<th>Description</th>
							</thead>
							<tbody>

							<g:if test="${roomTypeInstance?.photoUrl}">
								<td>
									<span id="photo-label" class="property-label"></span>
									<r:img file="${roomTypeInstance?.photoUrl}" style="height:120px; width: 170px;"/>
								</td>
							</g:if>

							<g:if test="${roomTypeInstance?.defaultRate}">
							<td>
								%{--<span id="defaultRate-label" class="property-label"><g:message code="roomType.defaultRate.label" default="Room Rate" /></span>--}%
									<span class="property-value" aria-labelledby="defaultRate-label"><g:fieldValue bean="${roomTypeInstance}" field="defaultRate"/></span>
							</td>
							</g:if>

							<g:if test="${roomTypeInstance?.capacity}">
							<td>
								%{--<span id="capacity-label" class="property-label"><g:message code="roomType.capacity.label" default="Capacity" /></span>--}%

									<span class="property-value" aria-labelledby="capacity-label"><g:fieldValue bean="${roomTypeInstance}" field="capacity"/></span>

							</td>
							</g:if>

							<g:if test="${roomTypeInstance?.name}">
							<td>
								%{--<span id="name-label" class="property-label"><g:message code="roomType.name.label" default="Room Type" /></span>--}%

									<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${roomTypeInstance}" field="name"/></span>

							</td>
							</g:if>

							<g:if test="${roomTypeInstance?.description}">
								<td>
									%{--<span id="description-label" class="property-label"><g:message code="roomType.description.label" default="Description" /></span>--}%

									<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${roomTypeInstance}" field="description"/></span>

								</td>
							</g:if>
							</tbody>
							</table>

							<g:form url="[resource:roomTypeInstance, action:'delete']" method="DELETE">

								<g:link class="btn btn-primary" action="edit" resource="${roomTypeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
								<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />

							</g:form>


					</div>


			</div>
		   </div>
		</div>



	</body>
</html>
