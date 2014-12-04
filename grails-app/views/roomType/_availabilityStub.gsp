<div class="col-md-4">
    <div class="panel panel-default room-type-stub" data-price="${roomType.defaultRate}" data-room-type="${roomType.name}">
        <div class="panel-hover" id="hover-${roomType.id}">
            <span class="glyphicon glyphicon-ok-sign"></span>
        </div>
        <div class="panel-body">
            <div class="thumbnail">
                <r:img file="${roomType.photoUrl}"/>
            </div>
            <div class="caption">
                <h3>${roomType.name}</h3>
                <h4 class="currency-highlight"><g:formatNumber number="${roomType.defaultRate}" type="currency" currencyCode="PHP"/></h4>
                <p>${roomType.description}</p>
            </div>
        </div>
    </div>
</div>