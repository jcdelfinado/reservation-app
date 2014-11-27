<div class="col-md-4">
    <div class="room-type-stub">
        <div class="thumbnail">
            <r:img file="${roomType.photoUrl}"/>
        </div>
        <div class="caption">
            <h3>${roomType.name}</h3>
            <h4 class="currency-highlight"><g:formatNumber number="${roomType.defaultRate}" type="currency" currencyCode="PHP"/></h4>
            <span class="help-block">Available Rooms of this type: ${roomType.availableCount}</span>
            <p>${roomType.description}</p>
        </div>
    </div>
    <div class="availability-spinner">
        <h4>Reserve this</h4>
        <button class="btn btn-default btn-spinner" data-action="subtract" data-target="#${roomType.id}"><span class="glyphicon glyphicon-minus"></span></button>
        <span class="reserve-num" id="${roomType.id}" data-name="${roomType.name}" data-price="${roomType.defaultRate}" data-max="${roomType.availableCount}">0</span>
        <button class="btn btn-default btn-spinner" data-action="add" data-target="#${roomType.id}"><span class="glyphicon glyphicon-plus"></span></button>
    </div>
</div>