<%@ page import="reservation.app.Reservation" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'reservation.label', default: 'Reservation')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<g:render template="/navAdmin"/>
<div class="container">
    <h3>Add Reservation</h3>
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
    <g:form class="col-md-4" url="[resource:reservationInstance, action:'update']" method="PUT" >
        <g:hiddenField name="version" value="${reservationInstance?.version}" />
        <fieldset class="form">
            <g:render template="availabilityVerticalForm"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
