<g:form controller="reservation" action="details" method="GET" class="form-inline">
    <div class="form-group" style="text-align: right">
        <label class="control-label">Check In</label>
        <input type="date"  value="${formatDate(format: 'yyyy-MM-dd', date: checkIn)}" name="checkIn" class="form-control" required=""/>
    </div>
    <div class="form-group">
        <label class="control-label">Check Out</label>
        <input type="date" name="checkOut" value="${formatDate(format: 'yyyy-MM-dd', date: checkOut)}" class="form-control" required=""/>
    </div>
    <div class="form-group">
        <label class="control-label">No. of Guests</label>
        <input type="number" name="guests" min=1 value="${guests}" class="form-control" required=""/>
    </div>
    <button class="btn btn-default">Check Availability</button>
</g:form>