    <g:form controller="reservation" action="details" method="GET" class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-md-4">Check In</label>
            <div class="col-md-8">
                <input type="text" id="checkIn-field" name="checkIn" class="form-control"  required="" placeholder="Select you check in date"/>

            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-4">Check Out</label>
            <div class="col-md-8">
                <input disabled type="text" id="checkOut-field" name="checkOut" class="form-control"  required="" placeholder="Select you check out date"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-4">No. of Guests</label>
            <div class="col-md-8">
                <input type="number" name="guests" min=1 value="1" class="form-control" required=""/>
            </div>
        </div>
        <button class="btn btn-primary col-md-12">Check Availability</button>
    </g:form>