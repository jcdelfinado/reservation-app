<div class="reservation-form col-md-4">
    <h2>Book Now!</h2>
    <g:form controller="reservation" action="details" method="GET" class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-md-4">Check In</label>
            <div class="col-md-8">
                <input type="date" name="checkIn" class="form-control" required=""/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-4">Check Out</label>
            <div class="col-md-8">
                <input type="date" name="checkOut" class="form-control" required=""/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-4">No. of Guests</label>
            <div class="col-md-8">
                <input type="number" name="guests" min=1 value="1" class="form-control" required=""/>
            </div>
        </div>
        <button class="btn btn-primary col-md-12">Submit</button>
    </g:form>
</div>