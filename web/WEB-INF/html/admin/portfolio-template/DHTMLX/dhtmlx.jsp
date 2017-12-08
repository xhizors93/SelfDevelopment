<div id="scheduler_here" class="dhx_cal_container" style='width:auto; height:500px;'>
    <div class="dhx_cal_navline">
        <div class="dhx_cal_prev_button">&nbsp;</div>
        <div class="dhx_cal_next_button">&nbsp;</div>
        <div class="dhx_cal_today_button"></div>
        <div class="dhx_cal_date"></div>
        <div class="dhx_cal_tab" name="day_tab" style="right:204px;"></div>
        <div class="dhx_cal_tab" name="week_tab" style="right:140px;"></div>
        <div class="dhx_cal_tab" name="month_tab" style="right:76px;"></div>
    </div>
    <div class="dhx_cal_header">
    </div>
    <div class="dhx_cal_data">
    </div>
</div>

<link rel="stylesheet" href="../library/dhtmlx-scheduler/codebase/dhtmlxscheduler_flat.css" type="text/css">
<script src="../library/dhtmlx-scheduler/codebase/dhtmlxscheduler.js" type="text/javascript"></script>

<script>
    
    $(document).ready(function(){
        
        scheConfig();
        scheInit();
        scheLoad();

        //config
        function scheConfig()
        {
            scheduler.config.show_loading = true;
        }

        //initiate
        function scheInit()
        {
            scheduler.init('scheduler_here',new Date(),"month");
        }

        //load json data from mapping to div
        function scheLoad()
        {
            scheduler.load("../admin/loadScheduler.htm", "json");
            /*scheduler.parse([
                        {id:1, text:"Meeting",   start_date:"04/11/2017 14:00",end_date:"04/12/2017 17:00"},
                        {id:2, text:"Conference",start_date:"04/18/2017 12:00",end_date:"04/19/2017 19:00"},
                        {id:3, text:"Interview", start_date:"04/24/2017 09:00",end_date:"04/25/2017 10:00"}
                    ],"json");
            */
        }
        
        //save
        scheduler.attachEvent("onEventAdded", function(id,ev){
            $('#scheduler_here').dimmer('add content','<div class="ui text loader">Refreshing...</div>');
            $('#scheduler_here').dimmer('show');
            require(["dojo/request/xhr"],function(xhr){
                xhr("../admin/saveBooking.htm",{  
                    method: "POST",
                    data: "id="+id+"&ev="+JSON.stringify(ev)
                })
                .then(function(response) 
                   {
                        var result =  JSON.parse(response.toString());
                        $('#scheduler_here').dimmer('hide');
                        console.log(result.result);
                        
                   },            
                   function(error) 
                   {   
                        $('#scheduler_here').dimmer('hide');
                        console.log(error);
                   }
               );

             }); 
        });
        
        //update
        scheduler.attachEvent("onEventChanged", function(id,ev){
            $('#scheduler_here').dimmer('add content','<div class="ui text loader">Refreshing...</div>');
            $('#scheduler_here').dimmer('show');
            require(["dojo/request/xhr"],function(xhr){
                xhr("../admin/saveBooking.htm",{  
                    method: "POST",
                    data: "id="+id+"&ev="+JSON.stringify(ev)
                })
                .then(function(response) 
                   {
                        var result =  JSON.parse(response.toString());
                        $('#scheduler_here').dimmer('hide');
                        console.log(result.result);
                        
                   },            
                   function(error) 
                   {   
                        $('#scheduler_here').dimmer('hide');
                        console.log(error);
                   }
               );

             }); 
        });
        
        //delete
        scheduler.attachEvent("onEventDeleted", function(id){
        
            if(scheduler.getState().new_event){
                    // do not send update if it's new event being canceled
                    return;
            }else{
                // send update
                $('#scheduler_here').dimmer('add content','<div class="ui text loader">Refreshing...</div>');
                $('#scheduler_here').dimmer('show');
                require(["dojo/request/xhr"],function(xhr){
                    xhr("../admin/deleteBooking.htm",{  
                        method: "POST",
                        data: "id="+id
                    })
                    .then(function(response) 
                       {
                            var result =  JSON.parse(response.toString());
                            $('#scheduler_here').dimmer('hide');
                            console.log(result.result);

                       },            
                       function(error) 
                       {   
                            $('#scheduler_here').dimmer('hide');
                            console.log(error);
                       }
                   );

                 }); 
            }

            
            
            
        });
        
        //cancel
//        scheduler.attachEvent("onEventCancel", function(id, flag){
//            //any custom logic here
//        });
//        
//        //click on empty
//        scheduler.attachEvent("onEmptyClick", function (date, e){
//                //any custom logic here
//         });
    });
    
 </script>