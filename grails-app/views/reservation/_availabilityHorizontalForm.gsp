<g:form controller="reservation" action="details" method="GET" class="form-inline">
    <div class="form-group" style="text-align: right">
        <label class="control-label">Check In</label>
        <input type="text" id="checkIn-field" value="${formatDate(format: 'MM/dd/yyyy', date: availabilityCmd.checkIn)}" name="checkIn"/>
        <g:hasErrors bean="${ availabilityCmd }" field="checkIn">
            <span class="glyphicon glyphicon-remove form-control-feedback"></span>
            <g:eachError bean="${ availabilityCmd }" field="checkIn" var="e">
                <span class="help-block"><g:message error="${message(code: 'invalid.checkIn')}"/></span>
            </g:eachError>
        </g:hasErrors>
    </div>
    <div class="form-group">
        <label class="control-label">Check Out</label>
        <input class="form-control" disabled  type="text" id="checkOut-field" name="checkOut" value="${formatDate(format: 'MM/dd/yyyy', date: availabilityCmd.checkOut)}"/>

    </div>
    <div class="form-group">
        <label class="control-label">No. of Guests</label>
        <input type="number" name="guests" min=1 value="${availabilityCmd.guests}" class="form-control" required=""/>
    </div>
    <button class="btn btn-default">Check Availability</button>
</g:form>