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
    <g:render template="availabilityHorizontalForm" model="['checkIn':checkIn, 'checkOut':checkOut,'guests':guests]"/>
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
                      <h4>${roomType.availableCount}</h4>
                  </div>
              </div>
            </g:each>
        </div>
        <fieldset class="reservation-details col-md-4">
            <legend>Reservation Summary</legend>

        </fieldset>
    </div>
</body>
</html>