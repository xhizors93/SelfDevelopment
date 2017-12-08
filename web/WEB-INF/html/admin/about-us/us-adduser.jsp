<h2 class="ui dividing header">
    Add User
    <button type="button" class="ui right floated mini green button" onclick="addNewUser();"><i class="plus icon"></i>Add</button>
</h2>

<table align="center">
    <tr>
        <td>First Name</td>
        <td>:</td>
        <td>
            <div class="ui mini input">
                <input class="firstnameclearable" type="text" id="firstname">
            </div>
        </td>
    </tr>
    <tr>
        <td>Last Name</td>
        <td>:</td>
        <td>
            <div class="ui mini input">
                <input class="lastnameclearable" type="text" id="lastname">
            </div>
        </td>
    </tr>
</table>

<br/>

<table id="example" class="ui celled table" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>No. </th>
                <th>Image</th>
                <th class="firstname">First Name</th>
                <th class="lastname">Last Name</th>
                <th>Address</th>
                <th>Action</th>
            </tr>
        </thead>
</table>

<script>
    
    
    
    $(function(){
        //grid
        var table = $('#example').DataTable({
            "ajax": {
                    "url": "../admin/userList.htm"
            },
            "columns": [
                { "data": "user.number" },
                { "data": "user",render:function(user){
                        return "<center><img src='../library/img/profileimage2.jpeg' class='ui mini rounded image'></img></center>";
                }},
                { "data": "user",render:function(user){
                        return "<font color='blue' style='cursor:pointer;' onclick='viewUserProfile("+user.userid+")'>"+user.firstname+"</font>";
                    }
                },
                { "data": "user.lastname" },
                { "data": "user.address",render: function (data) {
                        return data == null ? "<center>-<center>" : data;
                    }
                },
                { "data": "user",render:function(user){
                        return '<div class="ui small basic icon buttons">'
                               + '<button class="ui button" title="Edit User"><i class="blue edit icon"></i></button>'
                               + '<button class="ui button" title="Delete User"><i class="red delete icon"></i></button>'
                               + '<button class="ui button" title="Edit User Account" onclick="createUserAccount('+user.userid+')"><i class="green user icon"></i></button>'
                              + '</div>';
                    }
                }
            ],
            "dom":'<"ui stackable grid"'
                    +'<"row"<"right aligned wide column"l>>'    // l - list return display 
                    +'<"row dt-table"<"sixteen wide column"t>>' // t - table
                    +'<"row"<"seven wide column"i><"right aligned nine wide column"p>>' // i - information, p - pagination
                 +'>'
        });
        
        $('#firstname').keyup(function() {
            var val = $(this).val().toLowerCase();
            table.columns('.firstname').search(val, true, false).draw();
        });
        
        $('#lastname').keyup(function() {
            var val = $(this).val().toLowerCase();
            table.columns('.lastname').search(val, true, false).draw();
        });
        
        //clearsearch
        $('.firstnameclearable').clearSearch({
            callback:function(){
                table.columns('.firstname').search('', true, false).draw();
            }
        });
        
        $('.lastnameclearable').clearSearch({
            callback:function(){
                table.columns('.lastname').search('', true, false).draw();
            }
        });
    })
    
    //dialog
    var dialog, viewDialog,userAccDialog;
    require(["dojox/widget/DialogSimple"],
            function(DialogSimple)
            {
                window.addNewUser = function()
                {
                    dialog = new DialogSimple({
                            href:"../admin/addNewUserDialog.htm",
                            executeScripts:true,
                            title: 'Add New User',
                            style: "width: 50%; height:auto; overflow-x:hidden;overflow-y:auto;",
                            onHide: function() {
                               dialog.destroyDescendants();
                             }
                        });
                    dialog.show();
                }
                
                window.viewUserProfile = function(userid)
                {
                    viewDialog = new DialogSimple({
                            href:"../admin/viewUserProfile.htm?userid="+userid,
                            executeScripts:true,
                            title: 'View User',
                            style: "width: 50%; height:auto; overflow-x:hidden;overflow-y:auto;",
                            onHide: function() {
                               viewDialog.destroyDescendants();
                               $("body").css("overflow", "auto");   //to enable overflow in dialog close
                             },
                             onShow: function(){
                                 $("body").css("overflow", "hidden");   //to disables overflow in dialog open
                             }
                        });
                    viewDialog.show();
                }
                
                window.createUserAccount = function(userid)
                {
                    userAccDialog = new DialogSimple({
                            href:"../admin/createUserAccountDialog.htm?userid="+userid,
                            executeScripts:true,
                            title: 'Add User Account',
                            style: "width: 43%; height:30%; overflow-x:hidden;overflow-y:hidden;",
                            onHide: function() {
                               userAccDialog.destroyDescendants();
                               $("body").css("overflow", "auto");       //to enable overflow in dialog close
                             },
                             onShow: function(){
                                 $("body").css("overflow", "hidden");   //to disables overflow in dialog open
                             }
                    });
                    userAccDialog.show();
                }
            }
    );
    
    
    //form submit
    require(["dojo/request/xhr",
             "dojo/dom-form"],
             function(xhr,domForm)
             {      
                    //confirmation new profile
                    window.confirmSubmitNewProfile = function()
                    {
                        confirmationDialog("Create New Profile?","Are you sure you want to create new profile?",submitNewProfile,"auto","auto",null);
                    }
                    
                    //real submit new profile
                    window.submitNewProfile = function()
                    {
                        loadingLoad("Saving New Profile....");  //load loading
                        loadingShow();                          //show loading

                        var formQuery = domForm.toQuery("addNewUserForm");
                        //alert(formQuery);
                       
                        //loadingHide();
                        xhr("../admin/addNewUser.htm",{  
                            method: "POST",
                            data: formQuery
                        })
                        .then(function(response) 
                           {
                                var result =  JSON.parse(response.toString());
                                loadingHide();                              //hide loading
                                dialog.hide();                              //hide dialog
                                informationDialog("Notification",result.result,null,"auto","auto",null);
                                $('#example').DataTable().ajax.reload();    //refresh table
                                
                           },            
                           function(error) 
                           {   
                                loadingHide();
                                dialog.hide();  //hide dialog
                                informationDialog("Notification",error,null,"auto","auto",null);
                           }
                       );
                    }
                    
                    //confirmation create user account
                    window.confirmSubmitUserAccount = function()
                    {
                        confirmationDialog("Create/Update User Account","Are you sure you want to create/update user account?",submitUserAccount,"auto","auto",null);
                    }
                    
                    //real create user account
                    window.submitUserAccount = function()
                    {
                        loadingLoad("Saving User Account....");  //load loading
                        loadingShow();                          //show loading

                        var formQuery = domForm.toQuery("createUserAccount");
                        //alert(formQuery);
                       
                        //loadingHide();
                        xhr("../admin/createUserAccount.htm",{  
                            method: "POST",
                            data: formQuery
                        })
                        .then(function(response) 
                           {
                                var result =  JSON.parse(response.toString());
                                
                                loadingHide();                                  //hide loading
                                userAccDialog.hide();                              //hide dialog
                                informationDialog("Notification",result.result,null,"auto","auto",null);
                                
                           },            
                           function(error) 
                           {   
                                loadingHide();
                                userAccDialog.hide();
                                informationDialog("Notification",error,null,"auto","auto",null);
                           }
                       );
                    }
             });
</script>