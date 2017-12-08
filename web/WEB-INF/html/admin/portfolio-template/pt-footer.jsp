<div class="ui fluid container">
    <form data-dojo-type="dijit/form/Form" id="footerForm">
        <h2 class="ui dividing header">
            Edit Footer
            <button class="ui right floated mini blue button"><i class="save icon"></i>Save</button>
        </h2>
        <script type="dojo/method" event="onSubmit">
            if(this.validate())
            {
                submitFooter();
            }
            return false;
        </script>
            <label>Footer Description : </label>
            <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:true,missingMessage:'Please do not leave this empty!'" name="footerDesc"/>
    </form>
</div>

<script>
    require(["dojo/dom-form"],function(domForm){
       
       window.submitFooter = function()
       {
           var form = domForm.toQuery("footerForm");
           alert(form);
       }
       
    });
</script>