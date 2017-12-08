<form data-dojo-type="dijit/form/Form" id="addNewUserForm">
    <script type="dojo/method" event="onSubmit">
        if(this.validate())
        {
            confirmSubmitNewProfile();
        }
        return false;
    </script>
    <div class="ui stackable grid container fluid">
        <div class="row">
            <div class="eight wide column">
                <label>First Name: </label><br/>
                <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:true,missingMessage:'Masok lah nama tu!'" name="txtFirstName"/>
            </div>
            <div class="eight wide column">
                <label>Last Name: </label><br/>
                <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:true,missingMessage:'Mustahil xde bapak!'" name="txtLastName"/>
            </div>
        </div>
        <div class="row">
            <div class="eight wide column">
                <label>Date Of Birth: </label><br/>
                <input data-dojo-type="dijit/form/DateTextBox" data-dojo-props="required:true,missingMessage:'Camne ko boleh lahir?',constraints:{datePattern:'dd-MMM-yyyy',selector:'date'}" name="txtDOB"/>
            </div>
            <div class="eight wide column">
                <label>Age: </label><br/>
                <input data-dojo-type="dijit/form/NumberTextBox" data-dojo-props="required:true,missingMessage:'Tok jangan lupak!',invalidMessage:'Nombor jak oi!'" name="txtAge"/>
            </div>
        </div>
        <div class="row">
            <div class="eight wide column">
                <label>Race: </label><br/>
                <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:true,missingMessage:'Sikda bangsa ka?'" name="txtRace"/>
            </div>
            <div class="eight wide column">
                <label>Religion: </label><br/>
                <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:true,missingMessage:'Terok kau tok..Sikda agama!'" name="txtReligion"/>
            </div>
        </div>
        <div class="row">
            <div class="wide column">
                <label>Address: </label><br/>
                <input data-dojo-type="dijit/form/SimpleTextarea" rows="4" data-dojo-props="required:false,missingMessage:'Mun x tauk juak..refer IC kau!',style:{resize:'vertical'}" name="txtAddress"/>
            </div>
        </div>
        <div class="row">
            <div class="eight wide column">
                <label>Postcode: </label><br/>
                <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:false,regExp:'\\d{5}'" name="txtPostCode"/>
            </div>
            <div class="eight wide column">
                <label>City: </label><br/>
                <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:false" name="txtCity"/>
            </div>
        </div>
        <div class="row">
            <div class="eight wide column">
                <label>State: </label><br/>
                <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:false" name="txtState"/>
            </div>
            <div class="eight wide column">
                <label>Country: </label><br/>
                <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:false" name="txtCountry"/>
            </div>
        </div>
        <div class="row">
            <div class="wide column">
                <label>Description: </label><br/>
                <input data-dojo-type="dijit/form/SimpleTextarea" rows="4" data-dojo-props="required:false,style:{resize:'vertical'}" name="txtDescription"/>
            </div>
        </div>
        
        <div class="row">
            <div class="wide column">
                <button type="submit" class="ui small green button">Save</button>
                <button type="reset" class="ui small red button">Reset</button>
            </div>
        </div>
    </div>
</form>
