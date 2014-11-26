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
</head>

<body>
    <div class="container">
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
                  </div>
              </div>
            </g:each>
        </div>
        <div class="reservation-details col-md-4">
            <g:render template="reservationFront" model="['checkIn':checkIn, 'checkOut':checkOut,'guests':guests]"/>
        </div>
    </div>
</body>
</html>