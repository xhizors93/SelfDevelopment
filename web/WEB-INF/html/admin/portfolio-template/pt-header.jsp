<div class="ui fluid container">
    <form data-dojo-type="dijit/form/Form" id="headerForm" method="post">
        <h2 class="ui dividing header">
            Edit Header
            <button class="ui right floated mini blue button"><i class="save icon"></i>Save</button>
        </h2>
        <script type="dojo/method" event="onSubmit">
            if(this.validate())
            {
                submitHeader();
            }
            return false;
        </script>
            <label>Header Slogan : </label>
            <input data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:true" name="headerSlogan"/>
    </form>
</div>

<h2 class="ui dividing header">
  Popup Button
  <button class="ui right floated mini teal button">Button</button>
</h2>
<button data-dojo-type="dijit/form/Button" data-dojo-props="onClick:testpopup">Saje Try</button>

<h2 class="ui dividing header">
  Image Uploader / File Uploader
  <button class="ui right floated  mini inverted blue button"><i class="upload icon"></i>Upload</button>
</h2>

<div id="profileImageUploader"></div>

<script>
    
    window.testpopup = function()
    {
        w2popup.open({
            title     : 'Test Popup',
            body      : '<div class="w2ui-centered">Saja Test Try</div>',
            buttons   : '<button class="w2ui-btn" onclick="w2popup.close();">Close</button> ',
            showClose : true,
            modal     : true,
            width     : 500,
            height    : 300
        });
    }
    
    require(["dojo/dom-form"],function(domForm){
       
       window.submitHeader = function()
       {
           var form = domForm.toQuery("headerForm");
           alert(form);
       }
       
    });
    
    //animation for uploaded file
    jQuery.fn.fadeThenSlideToggle = function(speed, easing, callback) {
      if (this.is(":hidden")) {
        return this.slideDown(speed, easing).fadeTo(speed, 1, easing, callback);
      } else {
        return this.fadeTo(speed, 0, easing).slideUp(speed, easing, callback);
      }
    };
    
    
    //image uploader passing parameter
    //var afterPackParam = {consId:${consId},userId: ${userId},type: "AFTER PACKING"};
    var AfterPackUploader = new qq.FineUploader({
        element: document.getElementById('profileImageUploader'),
        template: 'ImageUploader',
        request:{
            endpoint:"#"
        },
        callbacks:{
            onUpload: function(){
                //this.setParams(afterPackParam);
            },
            onAllComplete: function(){
                console.log("COMPLETE");
//                    if($("#imageAfterPacking .qq-upload-list").children().size()>=1)
//                    {
//                        for (var a=0;a<$("#imageAfterPacking .qq-upload-list").children().size();a++)
//                        {
//                            $($("#imageAfterPacking .qq-upload-list").children()[a]).fadeThenSlideToggle();
//                        }
//
//                        setTimeout(function(){
//                            $("#imageBeforeConservation .qq-upload-list").children().remove();
//                            console.log("REMOVE ALL COMPLETE");
//                        }, 1000);
//                    }
//
//                    $( "#afterPack" ).load( "Tab-Edit-My-Conservation-Task-Report.htm?userId=${userId}&consId=${consId} #afterPack" );

                    console.log("COMPLETE");
            }   
        },
        cors: {
            expected: true,
            sendCredentials: true
        },
        multiple:true,
        autoUpload: false,
        debug: true,
        validation: {
            allowedExtensions: ['jpeg','jpg','bmp','png']
        }
    });
    
</script>