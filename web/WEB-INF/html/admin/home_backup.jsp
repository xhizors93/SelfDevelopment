<%-- 
    Document   : home
    Created on : 18-Oct-2017, 13:53:51
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
try {
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    if (session.getAttribute("userid")==null) {
%>
<script>
            window.location = "../admin/index.htm";
</script>
<%
    }
    else {}
}
catch(Exception ex) {
    out.println(ex);
}
%>

<html>
    <head>
        <!-- Standard Meta -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

        <!-- Site Properties -->
        <title>Admin - Home Page</title>
        
        <!-- icon-->
        <link rel="shortcut icon" type="image/x-icon" href="../library/img/admin.png" /> 
        
        <!-- css -->
        <link rel="stylesheet" type="text/css" href="../library/semanticui/semantic.min.css">
        <link rel="stylesheet" type="text/css" href="../library/w2ui/dist/w2ui.css">
        <link rel="stylesheet" type="text/css" href="../library/dojo/themes/flat/flat.css">
        <link rel="stylesheet" href="../library/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="../library/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="../library/fine-uploader/fine-uploader-new.css">
        
        <!-- js -->
        <script src="../library/jquery-2.1.4.js"></script>
        <script src="../library/semanticui/semantic.min.js"></script>
        <script src="../library/w2ui/dist/w2ui.js"></script>
        <script src="../library/fine-uploader/fine-uploader.js" type="text/javascript"></script>
        
         <!-- js [for dojo only]--> 
<!--        <script>
		var dojoConfig = {
                    async: true,
                    packages: [{
                        name: "dojo",
                        location: '../dojo',
                        main: "dojo.js"
                    }],
                    parseOnLoad:false
		};
	</script>-->
        <script type="text/javascript" src="../library/dojo/dojo/dojo.js" data-dojo-config="parseOnLoad:false,async:true"></script>
        <script>
            require(["dojo/parser"],function(parser){
               parser.parse(); 
            });
        </script>
        
        <!-- custom script -->
        <script src="../library/loadPath.js"></script>
        
        <!-- fine uploader -->
        <script type="text/template" id="ImageUploader">
            <div class="qq-uploader-selector qq-uploader" qq-drop-area-text="Drop files here" style="min-height:3em !important;font-size: 70%;">
                <div class="qq-total-progress-bar-container-selector qq-total-progress-bar-container">
                    <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-total-progress-bar-selector qq-progress-bar qq-total-progress-bar"></div>
                </div>
                <div class="qq-upload-drop-area-selector qq-upload-drop-area" qq-hide-dropzone>
                    <span class="qq-upload-drop-area-text-selector"></span>
                </div>
                <div class="buttons">
                    <div class="qq-upload-button-selector qq-upload-button" >
                        <div style="font-size:13px;">Select files</div>
                    </div>
                </div>
                <span class="qq-drop-processing-selector qq-drop-processing">
                    <span>Processing dropped files...</span>
                    <span class="qq-drop-processing-spinner-selector qq-drop-processing-spinner"></span>
                </span>
                <ul class="qq-upload-list-selector qq-upload-list" aria-live="polite" aria-relevant="additions removals">
                    <li>
                        <div class="qq-progress-bar-container-selector">
                            <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-progress-bar-selector qq-progress-bar"></div>
                        </div>
                        <span class="qq-upload-spinner-selector qq-upload-spinner"></span>
                        <img class="qq-thumbnail-selector" qq-max-size="100" qq-server-scale>
                        <label>File Name: </label>
                        <span class="qq-upload-file-selector qq-upload-file"></span>
                        <span class="qq-edit-filename-icon-selector qq-edit-filename-icon" aria-label="Edit filename"></span>
                        <input class="qq-edit-filename-selector qq-edit-filename" tabindex="0" type="text">
                        <span class="qq-upload-size-selector qq-upload-size"></span>
                        <button type="button" class="qq-btn qq-upload-cancel-selector qq-upload-cancel">Cancel</button>
                        <button type="button" class="qq-btn qq-upload-retry-selector qq-upload-retry">Retry</button>
                        <button type="button" class="qq-btn qq-upload-delete-selector qq-upload-delete">Delete</button>
                        <span role="status" class="qq-upload-status-text-selector qq-upload-status-text"></span>
                    </li>
                </ul>

                <dialog class="qq-alert-dialog-selector">
                    <div class="qq-dialog-message-selector"></div>
                    <div class="qq-dialog-buttons">
                        <button type="button" class="qq-cancel-button-selector">Close</button>
                    </div>
                </dialog>

                <dialog class="qq-confirm-dialog-selector">
                    <div class="qq-dialog-message-selector"></div>
                    <div class="qq-dialog-buttons">
                        <button type="button" class="qq-cancel-button-selector">No</button>
                        <button type="button" class="qq-ok-button-selector">Yes</button>
                    </div>
                </dialog>

                <dialog class="qq-prompt-dialog-selector">
                    <div class="qq-dialog-message-selector"></div>
                    <input type="text">
                    <div class="qq-dialog-buttons">
                        <button type="button" class="qq-cancel-button-selector">Cancel</button>
                        <button type="button" class="qq-ok-button-selector">Ok</button>
                    </div>
                </dialog>
            </div>
        </script> 
    </head>
    <style>
        
        
        /* for larger screen */
        .ui.menu .toc.item {
            display: none;
        }
        
        #seconddisplay {
            display: none;
        }
        
        .footer {
            position: absolute;
            right: 0;
            bottom: 0;
            left: 0;
            padding: 1rem;
            background-color: #c4c5c6;
            text-align: center;
        }
        
        /* for mobile screen */
        @media only screen and (max-width: 700px) and (min-width: 400px) {
            .ui.menu .toc.item {
                display: block;
            }
            
            #firstdisplay{
                display: none !important;
            }
            
            #seconddisplay {
                display: block !important;
            }
        }
        
        
        
    </style>
    <body class="flat">
        
        <!-- Sidebar Menu -->
        <div class="ui vertical inverted sidebar menu">
            <center style="padding:1em">
                <div class="ui inverted header">Our Portfolio</div>
            </center>
            <center>
                    <img src="../library/img/profileimage2.jpeg" class="ui image small circular" >
                    <div class="ui statistic inverted">
                            <div class="label">${session_username}</div>
                    </div>
            </center>
            <a class="teal item" href="javascript:void(0);" onclick="test1()">
                <i class="header icon"></i>
                Header
            </a>
            <a class="item" href="javascript:void(0);" onclick="test2()">
                <i class="trademark icon"></i>
                Footer
            </a>
        </div>
        <!-- Sidebar Menu -->
        
        
        <div class="pusher" style="background-color:#eff3f9;overflow:auto;">
            <!-- header -->
            <div class="ui small pointing menu header" style="border-radius: 0;background-color: #efefef;">
                <a class="toc item">
                    <i class="sidebar icon"></i>
                </a>
                <div class="right menu">
                    <div class="ui dropdown pointing item">
                        <i class="hand peace icon"></i>
                        Welcome back,<b style="text-transform: uppercase;"> ${session_username}</b>
                        <i class="dropdown icon"></i>
                        <div class="menu">
                            <div class="item">Applications</div>
                            <div class="item">International Students</div>
                            <div class="item">Scholarships</div>
                          </div>
                    </div>
                    <a class="item" href="javascript:void(0)" onclick="logout()">
                        <i class="red wheelchair icon"></i>
                        <font color="red">Logout</font>
                    </a>
                </div>
            </div>
            <!-- header -->
            
            <!-- content -->
            <div class="ui grid stackable container" id="firstdisplay">
                
                <!-- left hand side -->
                <div class="three wide column" id="firstcolumn">
                    <div class="ui blue segment">
                        <center>
                            <div class="ui circular profile image">
                                <div class="ui dimmer">
                                  <div class="content">
                                    <div class="center">
                                      <div class="ui very small button"><i class="pencil icon"></i>Edit</div>
                                    </div>
                                  </div>
                                </div>
                                <img src="../library/img/profileimage2.jpeg" class="ui image small circular" >
                            </div>
                            <div class="ui statistic">
                                    <div class="label">${session_username}</div>
                            </div>
                        </center>
                    </div>
                </div>
                <!-- left hand side -->
                
                <!-- right hand side -->
                <div class="thirteen wide column" id="secondcolumn">
                    <div class="ui compact menu">
                        <a class="item active" href="javascript:void(0)" onclick="test1()">
                            <i class="header icon"></i>
                            Header
                        </a>
                        <a class="item"  href="javascript:void(0)" onclick="test2()">
                            <i class="trademark icon"></i>
                            Footer
                        </a>
                      </div>
                    <div class="ui teal segment">
                        <div id="web-panel">
                            
                        </div>
                    </div>
                </div>
                <!-- right hand side-->
                
            </div>
                        
            <!-- hidden -->
            <div class="ui grid container" id="seconddisplay">
                <div class="sixteen wide column">
                    <div class="ui teal segment">
                        <div id="web-panel-media">
                            
                        </div>
                    </div>
                </div>
            </div>
            <!-- hidden -->
            
            <!-- content -->
            
            
            <!-- footer -->
            <div class="footer">
                <div class="ui container">
                  Our Portfolio 2017. All Rights Reserved
                </div>
            </div>
            <!-- footer -->
        </div>
    </body>
    <script>
        /*
         * SEMANTIC UI
         */
        
        //sidebar javascript
        $('.ui.sidebar').sidebar('attach events', '.toc.item');

        //accordion
        $('.ui.accordion').accordion({
            exclusive: false
        });

        //dimmer
        $('.profile.image').dimmer({
            on: 'hover'
        });

        //ui compact menu
        $(".ui.compact.menu > .item").click(function(e){
           $(".ui.compact.menu > .item.active").removeClass("active"); 
           $(this).addClass("active");
        });

        //dropdown
        $('.ui.dropdown').dropdown();
        
        
        //watch media screen width
        const mq = window.matchMedia( "(max-width: 700px) and (max-width: 400px)");
        
        //load page
        window.onload = function(){
            if(mq.matches){
                loadPathMedia("../admin/test1.htm");
            }else{
                loadPath("../admin/test1.htm");
            }
            //registry.byId("web-panel").setHref("../admin/test1.htm");
            
        }

        //test1
        window.test1 = function(){
            if(mq.matches){
                loadPathMedia("../admin/test1.htm");
            }else{
                loadPath("../admin/test1.htm");
            }
            //registry.byId("web-panel").setHref("../admin/test1.htm");
            
        }

        //test2
        window.test2 = function(){
            if(mq.matches){
                loadPathMedia("../admin/test2.htm");
            }else{
                loadPath("../admin/test2.htm");
            }
            //registry.byId("web-panel").setHref("../admin/test2.htm");
        }
        
        
        //logout
        function logout()
        {
            $('body').dimmer('add content','<div class="ui text loader">Logout...</div>');
            $('body').dimmer('show');

            $.ajax({
                type:'POST',
                url:'LogoutServlet',
                dataType:'json',
                success:function(response){
                    $('body').dimmer('hide');
                    if(response.result == "success"){
                        setTimeout(function(){
                                window.location = "../admin/index.htm";
                            },1000);
                    }else{
                        
                        w2popup.open({
                            title     : 'Notification',
                            body      : '<div class="w2ui-centered">'+response.message+'</div>',
                            buttons   : '<button class="w2ui-btn" onclick="w2popup.close();">Close</button> ',
                            showClose : true,
                            width     : 500,
                            height    : 300
                        });
                    }
                },error:function(error){
                    $('body').dimmer('hide');
                    //alert(error);
                }
            });
        }
    </script>
</html>
