<style>
    .field-icon {
        float: right;
        margin-left: -25px;
        margin-top: -25px;
        position: relative;
        z-index: 2;
      }
     
      .dijitToggleButton{
          margin:auto;
      }
</style>
<form data-dojo-type="dijit/form/Form" id="createUserAccount">
    <script type="dojo/method" event="onSubmit">
        if(this.validate())
        {
            confirmSubmitUserAccount();
        }
        return false;
    </script>
    <div class="ui stackable grid container fluid">
        <input type="hidden" name="txtUserId" value="${userId}"/>
        <div class="row">
            <div class="eight wide column">
                <label>Username: </label><br/>
                <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:true,missingMessage:'Please insert username'" name="txtUsername" value="${txtusername}"/>
            </div>
            <div class="eight wide column">
                <label>Password: </label><br/>
                <input type="password" id="txtUserpassword" data-dojo-type="dijit/form/ValidationTextBox" minlength="5" data-dojo-props="required:true,missingMessage:'Please insert password'" name="txtUserpassword" value="${txtuserpassword}">
                <button id="eyebutton"></button>
            </div>
        </div>
        <div class="row">
            <div class="wide column">
                <center>
                    <button type="submit" class="ui small green button">Save</button>
                <button type="reset" class="ui small red button">Reset</button>
                </center>
                
            </div>
        </div>
    </div>
</form>
<script>
    
    require(["dijit/form/ToggleButton", "dojo/domReady!"], function(ToggleButton){
        var eyebutton = new ToggleButton({
            iconClass: "fa fa-fw fa-eye",
            onChange: function(val){
                var input = $("#txtUserpassword");
                if(val == true){
                    this.set('iconClass',"fa fa-fw fa-eye fa-eye-slash");
                    input.attr("type", "text");
                }else{
                    this.set('iconClass',"fa fa-fw fa-eye");
                    input.attr("type", "password");
                }
            }
        }, "eyebutton");
    });
</script>
