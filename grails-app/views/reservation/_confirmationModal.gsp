<div class="modal fade" id="confirmation-modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <span class="glyphicon glyphicon-remove pull-right" data-dismiss="modal"></span>
                <h3>Confirm Reservation</h3>
            </div>
            <div class="modal-body">
                <g:form action="add" controller="reservation" name="confirmation-form" class="form" >
                    <input type="hidden" name="checkIn" value="${formatDate(format: 'yyyy-MM-dd', date: checkIn)}">
                    <input type="hidden" name="checkOut" value="${formatDate(format: 'yyyy-MM-dd', date: checkOut)}">
                    <input type="hidden" name="guests" value="${guests}">
                    <div class="form-group">
                        <label class="control-label">Your Name</label>
                        <input type="text" name="guestName" required="" class="form-control"/>
                        <span class="help-block">Your reservation will be placed under this name</span>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Email Address</label>
                        <input type="text" name="email" required="" class="form-control"/>
                        <span class="help-block">We won't make this public. We're going to send you an email confirming your reservation.</span>
                        <small class="help-block">
                            <b>Here's some text you probably won't read but explaining important things to you: </b>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.
                        </small>
                    </div>

                </g:form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button class="btn btn-primary" type="submit" form="confirmation-form">Confirm</button>
            </div>
        </div>
    </div>
</div>