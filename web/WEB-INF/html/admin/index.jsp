<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
  <!-- Standard Meta -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

  <!-- Site Properties -->
  <title>Admin - Login Page</title>
  <!-- icon-->
  <link rel="shortcut icon" type="image/x-icon" href="../library/img/admin.png" /> 
  
  <link rel="stylesheet" type="text/css" href="../library/semanticui/semantic.min.css">
  <link rel="stylesheet" type="text/css" href="../library/w2ui/dist/w2ui.css">
  <script src="../library/jquery-2.2.4.min.js"></script>
  <script src="../library/semanticui/semantic.min.js"></script>
  <script src="../library/w2ui/dist/w2ui.js"></script>
</head>
<body>
    <div class="ui middle aligned center aligned grid">
        <div class="column">
            <center><img class="ui small image" src="../library/img/admin.png"></center>
            <h2 class="ui teal image header">
                
                <div class="content">
                    Log-in to your account
                </div>
            </h2>
            <form class="ui large form" id="loginForm">
                <div class="ui segment">
                    <div class="field">
                        <div class="ui left icon input">
                            <i class="user icon"></i>
                            <input type="text" name="username" id="username" placeholder="Username">
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                            <i class="lock icon"></i>
                            <input type="password" name="userpassword" id="userpassword" placeholder="Password">
                        </div>
                    </div>
                    <button type="submit" name="submit" id="submit" class="ui fluid large teal submit button">Login</button>
                </div>
                <div class="ui error message"></div>
            </form>
        </div>
        
<!--        <div class="column">
            
            
        </div>-->
    </div>
</body>
<style type="text/css">
    body {
      background-color: #DADADA;
    }
    body > .grid {
      height: 100%;
    }
    .image {
      margin-top: -100px;
    }
    .column {
      max-width: 450px;
    }
  </style>
  <script type="text/javascript">
      
        window.onload = function(){
            $('body').dimmer('add content','<div class="ui text loader">Loading</div>');
            $('body').dimmer('show');

            setTimeout(function(){ 
                $('body').dimmer('hide'); 
            },2000); //wait for page load PLUS two seconds.
        }
        
        $(document).ready(function() 
        {       
            $('#loginForm').form({
                            fields: {
                                    name: {
                                      identifier  : 'username',
                                      rules: [
                                        {
                                          type   : 'empty',
                                          prompt : 'Please enter your username'
                                        }
                                      ]
                                    },
                                    password: {
                                      identifier  : 'userpassword',
                                      rules: [
                                        {
                                          type   : 'empty',
                                          prompt : 'Please enter your password'
                                        },
                                        {
                                          type   : 'length[6]',
                                          prompt : 'Your password must be at least 6 characters'
                                        }
                                      ]
                                    }
                            },onSuccess:function(e){
                                    $('#submit').addClass("loading");	//loading
                                    e.preventDefault();
                                    e.stopPropagation();
                                    $.ajax({
                                            type:'POST',
                                            url:'LoginServlet',
                                            data: "username="+$('#username').val()+"&userpassword="+$('#userpassword').val(),
                                            dataType:'json',
                                            success:function(response){
                                                    $('#submit').removeClass("loading");
                                                    
                                                    var url;
                                                    
                                                    if(response.result == "success"){
                                                        url = "../admin/loginSuccess.htm?session_username="+response.session_username;
                                                    }else{
                                                        url = "../admin/loginFail.htm";
                                                    }
                                                    
                                                    w2popup.load({
                                                        url: url,
                                                        width: 300,
                                                        height: 200,
                                                        showClose: false
                                                    });
                                                    
                                                    
                                                    
                                                    switch(response.result){
                                                        
                                                        case "success":
                                                            setTimeout(function(){w2popup.lock('',true)},1000);
                                                            setTimeout(function(){
                                                                w2popup.unlock(w2popup.close(redirect("../admin/home.htm")));
                                                            },2000);
                                                            break;
                                                        
                                                        default:
                                                            break;
                                                    }
                                                    
                                            },
                                            error:function(error){
                                                    $('#submit').removeClass("loading");
                                            }
                                    });
                            }
                    });
                        
                        function redirect(path)
                        {
                            setTimeout(function(){
                                window.location = path;
                            },1000);
                            
                        }
                        
		});
                
        
	</script>
</html>
