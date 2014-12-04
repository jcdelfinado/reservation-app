<g:form controller="reservation" action="details" method="GET" class="form-inline">
    <div class="form-group" style="text-align: right">
        <label class="control-label">Check In</label>
       %{-- <input type="text" id="checkIn-field" name="checkIn" class="form-control"  required="" value="${formatDate(format: 'yyyy-MM-dd', date: checkIn)}"/>    --}%
        <input type="text" id="checkIn-field" value="${formatDate(format: 'MM/dd/yyyy', date: checkIn)}" name="checkIn"/>
    </div>
    <div class="form-group">
        <label class="control-label">Check Out</label>

        <input class="form-control" disabled  type="text" id="checkOut-field" name="checkOut" value="${formatDate(format: 'MM/dd/yyyy', date: checkOut)}"/>

    </div>
    <div class="form-group">
        <label class="control-label">No. of Guests</label>
        <input type="number" name="guests" min=1 value="${guests}" class="form-control" required=""/>
    </div>
    <button class="btn btn-default">Check Availability</button>
</g:form>