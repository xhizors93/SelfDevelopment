<link rel="stylesheet" type="text/css" href="../library/dojo/dojox/widget/Calendar/Calendar.css">

<form data-dojo-type="dijit/form/Form" id="myProfileForm">
    <script type="dojo/method" event="onSubmit">
        if(this.validate())
        {
            confirmSubmitProfile();
        }
        return false;
    </script>
    <h2 class="ui dividing header">
        My Profile
        <button type="reset" class="ui right floated mini green button"><i class="repeat icon"></i>Reset</button>
        <button type="submit" class="ui right floated mini teal button"><i class="save icon"></i>Save</button>
    </h2>
    <div class="ui stackable grid container fluid">
        <input type="hidden" name="txtUserId" value="${userId}"/>
        <div class="row">
            <div class="eight wide column">
                <label>First Name: </label><br/>
                <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:true,missingMessage:'Masok lah nama tu!'" name="txtFirstName" value="${txtFirstName}"/>
            </div>
            <div class="eight wide column">
                <label>Last Name: </label><br/>
                <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:true,missingMessage:'Mustahil xde bapak!'" name="txtLastName"  value="${txtLastName}"/>
            </div>
        </div>
        <div class="row">
            <div class="eight wide column">
                <label>Date Of Birth: </label><br/>
                <input data-dojo-type="dijit/form/DateTextBox" data-dojo-props="required:true,missingMessage:'Camne ko boleh lahir?',constraints:{datePattern:'dd-MMM-yyyy',selector:'date'}" name="txtDOB"  value="${txtDOB}"/>
                <!--<input data-dojo-type="dojox/form/DateTextBox" data-dojo-props="required:true,missingMessage:'Camne ko boleh lahir?',constraints:{datePattern:'dd-MMM-yyyy',selector:'date'}" name="txtDOB"  value="${txtDOB}"/>-->
                <!--<input data-dojo-type="dojox/form/DateTextBox" data-dojo-props="required:true"/>-->
            </div>
            <div class="eight wide column">
                <label>Age: </label><br/>
                <input data-dojo-type="dijit/form/NumberTextBox" data-dojo-props="required:true,missingMessage:'Tok jangan lupak!',invalidMessage:'Nombor jak oi!'" name="txtAge"  value="${txtAge}"/>
            </div>
        </div>
        <div class="row">
            <div class="eight wide column">
                <label>Race: </label><br/>
                <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:true,missingMessage:'Sikda bangsa ka?'" name="txtRace"  value="${txtRace}"/>
            </div>
            <div class="eight wide column">
                <label>Religion: </label><br/>
                <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:true,missingMessage:'Terok kau tok..Sikda agama!'" name="txtReligion"  value="${txtReligion}"/>
            </div>
        </div>
        <div class="row">
            <div class="wide column">
                <label>Address: </label><br/>
                <input data-dojo-type="dijit/form/SimpleTextarea" rows="4" data-dojo-props="required:true,missingMessage:'Mun x tauk juak..refer IC kau!',style:{resize:'vertical'}" name="txtAddress"  value="${txtAddress}"/>
            </div>
        </div>
        <div class="row">
            <div class="eight wide column">
                <label>Postcode: </label><br/>
                <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:false,regExp:'\\d{5}'" name="txtPostCode"  value="${txtPostCode}"/>
            </div>
            <div class="eight wide column">
                <label>City: </label><br/>
                <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:false" name="txtCity"  value="${txtCity}"/>
            </div>
        </div>
        <div class="row">
            <div class="eight wide column">
                <label>State: </label><br/>
                <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:false" name="txtState"  value="${txtState}"/>
            </div>
            <div class="eight wide column">
                <label>Country: </label><br/>
                <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:false" name="txtCountry"  value="${txtCountry}"/>
            </div>
        </div>
        <div class="row">
            <div class="wide column">
                <label>Description: </label><br/>
                <input data-dojo-type="dijit/form/SimpleTextarea" rows="4" data-dojo-props="required:false,style:{resize:'vertical'}" name="txtDescription"  value="${txtDescription}"/>
            </div>
        </div>
    </div>
</form>

<script>
    
    window.confirmSubmitProfile = function()
    {
        confirmationDialog("Save Profile?","Are you sure you want to save?",submitProfile,"auto","auto",null);
    }
    
    window.submitProfile = function()
    {
        loadingLoad("Saving Profile....");
        loadingShow();
        require(["dojo/dom-form","dojo/request/xhr"],function(domForm,xhr){
            
            var formQuery = domForm.toQuery("myProfileForm");
            //alert(formQuery);
            xhr("../admin/updateProfile.htm",{  
                method: "POST",
                data: formQuery
            })
            .then(function(response) 
               {
                    var result =  JSON.parse(response.toString());
                    loadingHide();
                    informationDialog("Notification",result.result,null,"auto","auto",null);
               },            
               function(error) 
               {   
                    loadingHide();
                    informationDialog("Notification",error,null,"auto","auto",null);
               }
           );
        })
    }
    
</script>

