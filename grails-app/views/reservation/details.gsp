<%--
  Created by IntelliJ IDEA.
  User: rens
  Date: 11/25/14
  Time: 6:03 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
    <link type="text/css" href="${resource(dir: 'css', file: 'details.css')}" rel="stylesheet"/>
</head>

<body>
    <g:if test="${actionName == 'add'}">
        <g:render template="/navAdmin"/>
    </g:if>

    <g:if test="${actionName == 'details'}">
        <g:render template="/nav"/>
    </g:if>
    <div class="container">
    <g:if test="${flash.errors}">
        <g:each in="${flash.errors}" var="error">
            <div class="alert alert-danger">
                <button class="glyphicon glyphicon-remove pull-right" data-dismiss="alert"></button>
                <b>Oops! </b>${error}
            </div>
        </g:each>
    </g:if>
    <g:render template="availabilityHorizontalForm" model="['checkIn':checkIn, 'checkOut':checkOut,'guests':guests]"/>
        <div class="available-rooms col-md-8">
            <g:each in="${availableRoomTypes}" var="roomType">
                <g:render template="/roomType/availabilityStub" model="['roomType':roomType]"/>
            </g:each>
        </div>
        <fieldset class="reservation-details col-md-4">
            <legend>Reservation Summary</legend>
            <div class="reservation-summary">
                <ul>
                    <li>
                        <div class="col-md-4"><b>Check In:</b></div>
                        <div class="col-md-8">${formatDate(format:'dd MMM yyyy', date: checkIn)}</div>
                    </li>
                    <li>
                        <div class="col-md-4"><b>Check Out:</b></div>
                        <div class="col-md-8">${formatDate(format:'dd MMM yyyy', date: checkOut)}</div>
                    </li>
                    <li>
                        <div class="col-md-4"><b>Guests:</b></div>
                        <div class="col-md-8">${guests}</div>
                    </li>
                    <li>
                        <div class="col-md-4"><b>Room Type:</b></div>
                        <div class="col-md-8"><span id="room-type-indicator">None</span></div>
                    </li>
                    <li>
                        <div class="col-md-4"><h4>Price: </h4></div>
                        <div class="col-md-8"><span id="price">0.00</span></div>
                    </li>
                </ul>
                <button class="btn btn-primary col-md-12" data-toggle="modal" data-target="#confirmation-modal" id="submit-booking" disabled>Book this reservation now!</button>
                <g:render template="confirmationModal"/>
                <g:render template="/notif"/>
            </div>
        </fieldset>
    </div>
<g:javascript src="details.js"/>
</body>
</html>