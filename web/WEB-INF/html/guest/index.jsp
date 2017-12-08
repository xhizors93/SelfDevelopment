
<!DOCTYPE html>
<html>
<head>
  <!-- Standard Meta -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

  <!-- Site Properties -->
  <title>Welcome to Our Portfolio</title>
  <!-- icon-->
  <link rel="shortcut icon" type="image/x-icon" href="../library/img/homeicon.png" /> 
  
  <!-- css -->
  <link rel="stylesheet" type="text/css" href="../library/semanticui/semantic.min.css">
  <link rel="stylesheet" type="text/css" href="../library/semanticui-calendar/dist/calendar.min.css">
  <link rel="stylesheet" type="text/css" href="../library/w2ui/dist/w2ui.css">
  
  <!-- js -->
  <script src="../library/jquery-2.2.4.min.js"></script>
  <script src="../library/semanticui/semantic.min.js"></script>
  <script src="../library/semanticui-calendar/dist/calendar.min.js"></script>
  <script src="../library/w2ui/dist/w2ui.js"></script>
  <script src="../library/siema.min.js"></script>

  <style type="text/css">

    .masthead.segment {
      min-height: 650px;
      padding: 1em 0em;
    }
    .masthead .logo.item img {
      margin-right: 1em;
    }
    .masthead .ui.menu .ui.button {
      margin-left: 0.5em;
    }
    .masthead h1.ui.header {
      margin-top: 3em;
      margin-bottom: 0em;
      font-size: 4em;
      font-weight: normal;
    }
    .masthead h2 {
      font-size: 1.7em;
      font-weight: normal;
    }

    .ui.vertical.stripe {
      padding: 0em 0em;
    }
    .ui.vertical.stripe h3 {
      font-size: 2em;
    }
    .ui.vertical.stripe .button + h3,
    .ui.vertical.stripe p + h3 {
      margin-top: 3em;
    }
    .ui.vertical.stripe .floated.image {
      clear: both;
    }
    .ui.vertical.stripe p {
      font-size: 1.33em;
    }
    .ui.vertical.stripe .horizontal.divider {
      margin: 3em 0em;
    }

    .quote.stripe.segment {
      padding: 0em;
    }
    .quote.stripe.segment .grid .column {
      padding-top: 5em;
      padding-bottom: 5em;
    }

    .footer.segment {
      padding: 5em 0em;
    }

    .secondary.pointing.menu .toc.item {
      display: none;
    }

    @media only screen and (max-width: 770px) {
        
      .secondary.pointing.menu .item,
      .secondary.pointing.menu .menu {
        display: none;
      }
      .secondary.pointing.menu .toc.item {
        display: block;
      }
      .masthead.segment {
        min-height: 350px;
      }
      .masthead h1.ui.header {
        font-size: 2em;
        margin-top: 1.5em;
      }
      .masthead h2 {
        margin-top: 0.5em;
        font-size: 1.5em;
      }
    }


  </style>
  <script>
      $(document).ready(function(){
          
            // create sidebar and attach to menu open
            $('.ui.sidebar').sidebar('attach events', '.toc.item')

            //calendar
            $('#rangestart').calendar({
              type: 'date',
              endCalendar: $('#rangeend')
            });

            $('#rangeend').calendar({
              type: 'date',
              startCalendar: $('#rangestart')
            });

            //dropdown
            $('.ui.dropdown').dropdown({transition: 'drop'});

            //checkbox
            $('.ui.checkbox').checkbox();

            //siema slider
            const mySiema = new Siema({selector: '#siema1',draggable: false, loop: true, duration: 500});
            const mySiema2 = new Siema({selector: '#siema2',draggable: false, loop: true, duration: 500});

            $('#prev').on('click',function(){ mySiema.prev()});
            $('#next').on('click',function(){ mySiema.next()});

            $('#prev2').on('click',function(){ mySiema2.prev()});
            $('#next2').on('click',function(){ mySiema2.next()});

            //slide automatically
            setInterval(function(){
                mySiema.next();
                mySiema2.next();
            },3000);

            //image dim
            $('.imageDimmer').dimmer({
              on: 'hover'
            });
      });
      
      
  </script>
</head>
<body>

<!-- Sidebar Menu -->
<div class="ui vertical inverted sidebar menu">
    <a class="item">Home</a>
    <a class="item">Work</a>
    <a class="item">Company</a>
    <a class="item">Careers</a>
    <a class="item">Login</a>
    <a class="item">Signup</a>
</div>


<!-- Page Contents -->
<div class="pusher">
    <div class="ui inverted vertical masthead segment">
        <div class="ui container">
            <div class="ui large secondary inverted pointing menu">
                <a class="toc item">
                    <i class="sidebar icon"></i>
                </a>
                <div class="ui inverted huge header" style="text-align: center;">Welcome to Our Portfolio</div>
                <div class="right item">
                    
                    <a class="item"><i class="home icon"></i>Home</a>
                    <a class="item" href="#knowingus"><i class="address card outline icon"></i>Knowing Us</a>
                    <a class="ui dropdown item">
                        <i class="laptop icon"></i>
                        Portfolio
                        <div class="menu">
                            <div class="item"><i class="home icon"></i>Homestay Booking</div>
                            <div class="item"><i class="car icon"></i>Car Rental</div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        
        <div style="margin-top:2em;"></div>
        
        <div class="ui equal width grid container stackable">
            <div class="column">
                <div class="ui black inverted segment">
                    <div class="imageDimmer">
                        <div class="ui dimmer">
                            <div class="content">
                                <div class="center">
                                    <h2 class="ui inverted header">Homestay Booking</h2>
                                    <div class="ui button">View</div>
                                </div>
                            </div>
                        </div>
                        <div class="siema" id="siema1">
                            <div><img class="ui image" src="../library/img/Chrysanthemum.jpg" ></div>
                            <div><img class="ui image" src="../library/img/Desert.jpg"></div>
                            <div><img class="ui image" src="../library/img/Jellyfish.jpg"></div>
                            <div><img class="ui image" src="../library/img/Koala.jpg"></div>
                        </div>
                    </div>
                    <br/>
                    <button class="ui green left labeled icon button" id="prev">
                        <i class="left arrow icon"></i>Prev
                    </button>
                    <button class="ui green right floated right labeled icon button" id="next">
                        <i class="right arrow icon"></i>Next
                    </button>
                </div>
            </div>
            <div class="column">
                <div class="ui grey inverted segment">
                    <div class="imageDimmer">
                        <div class="ui dimmer">
                            <div class="content">
                                <div class="center">
                                    <h2 class="ui inverted header">Car Rental</h2>
                                    <div class="ui button">View</div>
                                </div>
                            </div>
                        </div>
                        <div class="siema" id="siema2">
                            <div><img class="ui image" src="../library/img/Chrysanthemum.jpg" ></div>
                            <div><img class="ui image" src="../library/img/Desert.jpg"></div>
                            <div><img class="ui image" src="../library/img/Jellyfish.jpg"></div>
                            <div><img class="ui image" src="../library/img/Koala.jpg"></div>
                        </div>
                    </div>
                    <br/>
                    <button class="ui green left labeled icon button" id="prev2">
                        <i class="left arrow icon"></i>Prev
                    </button>
                    <button class="ui green right floated right labeled icon button" id="next2">
                        <i class="right arrow icon"></i>Next
                    </button>
                </div>
            </div>
          </div>
        <div class="ui stackable grid container">
<!--            <div class="eleven wide column">
                <div class="ui segment">
                    <div id="imageDimmer">
                        <div class="ui dimmer">
                            <div class="content">
                                <div class="center">
                                    <h2 class="ui inverted header">Title</h2>
                                    <div class="ui primary button">Add</div>
                                    <div class="ui button">View</div>
                                </div>
                            </div>
                        </div>
                        <div class="siema">
                            <div><img class="ui image" src="../library/img/Chrysanthemum.jpg" ></div>
                            <div><img class="ui image" src="../library/img/Desert.jpg"></div>
                            <div><img class="ui image" src="../library/img/Jellyfish.jpg"></div>
                            <div><img class="ui image" src="../library/img/Koala.jpg"></div>
                        </div>
                    </div>
                    <br/>
                    <button class="ui green left labeled icon button" id="prev">
                        <i class="left arrow icon"></i>Prev
                    </button>
                    <button class="ui green right floated right labeled icon button" id="next">
                        <i class="right arrow icon"></i>Next
                    </button>
                </div>
            </div>
            <div class="five wide column">
                <div class="ui form segment">
                    <center>
                        <h2 class="ui green image header">
                            <div class="content">
                                Book Your Reservation
                            </div>
                        </h2>
                    </center>
                    
                    <div style="margin:2em;"></div>
                    
                    <div class="ui form">
                        <div class="field">
                            <label>Start date:</label>
                            <div class="ui calendar" id="rangestart">
                                <div class="ui input left icon">
                                    <i class="calendar icon"></i>
                                    <input type="text" placeholder="Start">
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <label>End date:</label>
                            <div class="ui calendar" id="rangeend">
                                <div class="ui input left icon">
                                    <i class="calendar icon"></i>
                                    <input type="text" placeholder="End">
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <label>Select Homestay:</label>
                            <div class="inline field">
                                <div class="ui checkbox">
                                    <input type="checkbox" value="Dahlia">
                                    <label>Dahlia Homestay</label>
                                </div>
                                <div class="ui checkbox">
                                    <input type="checkbox" value="Villa">
                                    <label>Villa Homestay</label>
                                </div>
                            </div>
                        </div>
                        
                        <button class="ui fluid green button" type="submit">Check Reservation</button>
                    </div>
                </div>
            </div>-->
        </div>
        
    </div>

    <div class="ui vertical stripe segment" id="knowingus">
        <div class="ui container" style="margin-bottom:10em;">
            <h2 class="ui horizontal header divider" style="margin-bottom: 2em;">
                Knowing Us
            </h2>
            <div class="ui four stackable link cards">
                <div class="card" onclick="openmodal()">
                    <div class="image">
                        <img src="../library/img/matthew.png">
                    </div>
                    <div class="content">
                        <div class="header">Matt Giampietro</div>
                        <div class="meta">
                            <a>Friends</a>
                        </div>
                        <div class="description">
                            Matthew is an interior designer living in New York.
                        </div>
                    </div>
                </div>
                <div class="card" onclick="openmodal()">
                    <div class="image">
                        <img src="../library/img/molly.png">
                    </div>
                    <div class="content">
                        <div class="header">Molly</div>
                        <div class="meta">
                          <span class="date">Coworker</span>
                        </div>
                        <div class="description">
                          Molly is a personal assistant living in Paris.
                        </div>
                    </div>
                </div>
                <div class="card" onclick="openmodal()">
                    <div class="image">
                      <img src="../library/img/elyse.png">
                    </div>
                    <div class="content">
                        <div class="header">Elyse</div>
                        <div class="meta">
                            <a>Coworker</a>
                        </div>
                        <div class="description">
                            Elyse is a copywriter working in New York.
                        </div>
                    </div>
                </div>
                <div class="card" onclick="openmodal()">
                    <div class="image">
                      <img src="../library/img/elyse.png">
                    </div>
                    <div class="content">
                        <div class="header">Elyse</div>
                        <div class="meta">
                            <a>Coworker</a>
                        </div>
                        <div class="description">
                            Elyse is a copywriter working in New York.
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>

    <div class="ui inverted vertical footer segment">
        <div class="ui container">
            <div class="ui stackable inverted divided equal height stackable grid">
                <div class="three wide column">
                    <h4 class="ui inverted header">About</h4>
                    <div class="ui inverted link list">
                        <a href="#" class="item">Sitemap</a>
                        <a href="#" class="item">Contact Us</a>
                        <a href="#" class="item">Religious Ceremonies</a>
                        <a href="#" class="item">Gazebo Plans</a>
                    </div>
                </div>
                <div class="three wide column">
                    <h4 class="ui inverted header">Services</h4>
                    <div class="ui inverted link list">
                        <a href="#" class="item">Banana Pre-Order</a>
                        <a href="#" class="item">DNA FAQ</a>
                        <a href="#" class="item">How To Access</a>
                        <a href="#" class="item">Favorite X-Men</a>
                    </div>
                </div>
                <div class="seven wide column">
                    <h4 class="ui inverted header">Footer Header</h4>
                    <p>Extra space for a call to action inside the footer that could help re-engage users.</p>
                </div>
            </div>
        </div>
    </div>
    
    <!-- modal -->
    <div class="ui longer modal">
        <i class="close icon"></i>
        <div class="ui centered aligned very big header">
            KNOW MORE ABOUT ME
        </div>
        <div class="image content">
            <div class="ui small circular image">
                <img src="../library/img/profileimage2.jpeg">
            </div>
            <div class="description">
                <div class="ui header">About Me?</div>
                <p style="font-size: 15px;">Hi! My name is Zakhirulnizam bin Arshad. Age 24 years old and I love programming.</p>
            </div>
        </div>
        <div class="actions">
            <div class="ui black deny button">
                Nope
            </div>
            <div class="ui positive right labeled icon button">
                Yep, that's me
                <i class="checkmark icon"></i>
            </div>
        </div>
    </div>
    
</div>

</body>
<script>
    window.openmodal = function(){
        $('.ui.longer.modal').modal('show');
    }
</script>
</html>
