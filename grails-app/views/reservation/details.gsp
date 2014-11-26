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
    <g:render template="/nav"/>
    <div class="container">
        <fieldset class="reservation-details col-md-4">
            <legend>Reservation Details</legend>
            <g:render template="reservationFront" model="['checkIn':checkIn, 'checkOut':checkOut,'guests':guests]"/>
        </fieldset>
        <div class="available-rooms col-md-8">
            <g:each in="${roomList}" var="roomType">
              <div class="col-md-4">
                  <div class="thumbnail">
                      <r:img file="${roomType.photoUrl}"/>
                  </div>
                  <div class="caption">
                      <h3>${roomType.name}</h3>
                      <p>${roomType.description}</p>
                      <h4><g:formatNumber number="${roomType.defaultRate}" type="currency" currencyCode="PHP"/></h4>
                      <h4>Availability: ${roomType.availableCount}</h4>
                  </div>
              </div>
            </g:each>
        </div>
    </div>
</body>
</html>