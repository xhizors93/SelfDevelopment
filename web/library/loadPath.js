
/*************/
/*  loadPath */
/*************/

//Content Pane (use in home.jsp)
require(["dojox/layout/ContentPane","dojo/domReady!"],function(ContentPane){
        var webpanel = new ContentPane({
            parseOnLoad:true,
            executeScripts:true,
            region:'center',
            onChange:function(){
                webpanel.destroyDescendants();
            }
        },"web-panel");
        
        window.loadPath = function(url){
                webpanel.setHref(url);
        }
});


/***********************/
/*  confirmationDialog */
/***********************/

//1. using w2confirm (currently use)
window.confirmationDialog = function(title,message,callback,width,height,parameter){
    
    var lebar = (width == "auto") ? "300px" : width;
    
    var tinggi = (height == "auto") ? "180px" : height;
    
    w2confirm({
        title        : title,
        msg          : message,
        width        : lebar,             // width of the dialog
        height       : tinggi             // height of the dialog
    }).yes(function(){
        if(callback){
            if(typeof parameter !== "undefined" || parameter != null){
                callback(parameter);
            }else{
                callback();
            }
            console.log('not null');
        }else{
            console.log('null');
        }
        
        
    })
}

//2. using dojo/ConfirmDialog (not use but still working)
/*
require(["dijit/ConfirmDialog"],function(ConfirmDialog){
        
        var confirmDialog = new ConfirmDialog({
            onHide:function(){
                confirmDialog.destroyDescendants();
            },
            onCancel:function(){
                console.log("cancel");
                confirmDialog.hide();
            }
         });
        
    
         window.confirmationDialog = function(title,message,callback,width,height,parameter){
             confirmDialog.set("title",title);
             confirmDialog.set("content",message);
             confirmDialog.set("style","width:"+width+";height:"+height);
             confirmDialog.set("onExecute",function(){
                if(callback){
                    if(typeof parameter !== "undefined" || parameter != null){
                        callback(parameter);
                    }else{
                        callback();
                    }
                }else{
                    console.log('callback is null');
                }
                confirmDialog.hide();
             });
             confirmDialog.show();
         }
});
*/

/***********************/
/*  informationDialog */
/***********************/
//1. w2ui
window.informationDialog = function(title,message,callback,width,height,parameter){
    
    var lebar = (width == "auto") ? "300px" : width;
    
    var tinggi = (height == "auto") ? "150px" : height;
    
    w2popup.open({
        title     : title,
        body      : '<div class="w2ui-centered">'+message+'</div>',
        buttons   : '<button class="w2ui-btn" onclick="w2popup.close();">Ok</button> ',
        width     : lebar,
        height    : tinggi,
        modal     : true,
        speed     : '0.4',
        onClose   : function () { 
            if(callback){
                console.log(parameter+" 1");
                if(typeof parameter !== "undefined" || parameter != null){
                    callback(parameter);
                }else{
                    callback();
                }
            }else{
                console.log(parameter+" 2");
            }
        }
    });
}

//2. dojox/widget/Dialog (currently not use but working)
/*
require(["dojox/widget/DialogSimple","dojo/fx/easing"],function(Dialog,easing){
    var infoDialog = new Dialog();
    
    window.informationDialog = function (title,message,callback,width,height,parameter){
        
        var content =  "<label>"+message+"</label><br/>"
            content += "<button data-dojo-type='dijit/form/Button' data-dojo-props='onClick:infoDialogHide,style:\"float:right;\"'>Ok</button>";
        
        infoDialog.set("title",title);
        infoDialog.set("content",content);
        infoDialog.set("style","width:"+width+";height:"+height);
        infoDialog.set("onHide",function(){
            if(callback){
                if(typeof parameter !== "undefined" || parameter != null){
                    callback(parameter);
                    console.log("callback with parameter");
                }else{
                    callback();
                    console.log("callback with no parameter");
                }
            }else{
                console.log("no callback");
            }
            infoDialog.destroyDescendants();
        });
        infoDialog.show();
    }
    
    window.infoDialogHide = function(){
        infoDialog.hide();
    }
});
*/


/***********************/
/*  loadingDimmer */
/***********************/

window.loadingLoad = function(message)
{
    $('body').dimmer('add content','<div class="ui text loader">'+message+'</div>');
}

window.loadingShow = function()
{
    $('body').dimmer('show');
}

window.loadingHide = function()
{
    $('body').dimmer('hide');
}