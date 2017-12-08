
<div class="ui stackable grid container fluid">
    <div class="row">
        <div class="wide column">
            <center><img src="../library/img/profileimage2.jpeg" class="ui small rounded image"></img></center>
        </div>
    </div>
    <div class="row">
        <div class="eight wide column">
            <label>First Name: </label><br/>
            <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="readOnly:true" name="txtFirstName" value="${txtFirstName}"/>
        </div>
        <div class="eight wide column">
            <label>Last Name: </label><br/>
            <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="readOnly:true" name="txtLastName"  value="${txtLastName}"/>
        </div>
    </div>
    <div class="row">
        <div class="eight wide column">
            <label>Date Of Birth: </label><br/>
            <input data-dojo-type="dijit/form/DateTextBox" data-dojo-props="readOnly:true,constraints:{datePattern:'dd-MMM-yyyy',selector:'date'}" name="txtDOB"  value="${txtDOB}"/>
        </div>
        <div class="eight wide column">
            <label>Age: </label><br/>
            <input data-dojo-type="dijit/form/NumberTextBox" data-dojo-props="readOnly:true" name="txtAge"  value="${txtAge}"/>
        </div>
    </div>
    <div class="row">
        <div class="eight wide column">
            <label>Race: </label><br/>
            <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="readOnly:true" name="txtRace"  value="${txtRace}"/>
        </div>
        <div class="eight wide column">
            <label>Religion: </label><br/>
            <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="readOnly:true" name="txtReligion"  value="${txtReligion}"/>
        </div>
    </div>
    <div class="row">
        <div class="wide column">
            <label>Address: </label><br/>
            <input data-dojo-type="dijit/form/SimpleTextarea" rows="4" data-dojo-props="readOnly:true,style:{resize:'vertical'}" name="txtAddress"  value="${txtAddress}"/>
        </div>
    </div>
    <div class="row">
        <div class="eight wide column">
            <label>Postcode: </label><br/>
            <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="readOnly:true" name="txtPostCode"  value="${txtPostCode}"/>
        </div>
        <div class="eight wide column">
            <label>City: </label><br/>
            <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="readOnly:true" name="txtCity"  value="${txtCity}"/>
        </div>
    </div>
    <div class="row">
        <div class="eight wide column">
            <label>State: </label><br/>
            <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="readOnly:true" name="txtState"  value="${txtState}"/>
        </div>
        <div class="eight wide column">
            <label>Country: </label><br/>
            <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="readOnly:true" name="txtCountry"  value="${txtCountry}"/>
        </div>
    </div>
    <div class="row">
        <div class="wide column">
            <label>Description: </label><br/>
            <input data-dojo-type="dijit/form/SimpleTextarea" rows="4" data-dojo-props="readOnly:true,style:{resize:'vertical'}" name="txtDescription"  value="${txtDescription}"/>
        </div>
    </div>
</div>
