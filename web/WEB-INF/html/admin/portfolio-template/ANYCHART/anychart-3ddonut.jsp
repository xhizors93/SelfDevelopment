<script src="../library/anychart-8.0.1/js/anychart-base.min.js"></script>
<script src="../library/anychart-8.0.1/js/anychart-ui.min.js"></script>
<script src="../library/anychart-8.0.1/js/anychart-exports.min.js"></script>

<!-- for tag cloud -->
<script src="../library/anychart-8.0.1/js/anychart-tag-cloud.min.js"></script>
<script src="../library/anychart-8.0.1/js/anychart-data-adapter.min.js"></script>

<link rel="stylesheet" href="../library/anychart-8.0.1/css/anychart-ui.min.css" />
<link rel="stylesheet" href="../library/anychart-8.0.1/fonts/css/anychart-font.min.css" />

<div id="3ddonut" style="height:400px;"></div>
<hr/>
<div id="tagcloud" style="height:400px;"></div>



<style>
    /* hide credit */
    .anychart-credits{
        display:none;
    }
</style>
<!-- pie3ddonut-->
<script type="text/javascript">
    anychart.onDocumentReady(function() {
      // create pie chart with passed data
      chart = anychart.pie3d([
        ['Oil shales', 11],
        ['Heavy oil', 3],
        ['Tar sands', 2],
        ['Proven reserves', 8],
        ['Future additions', 11],
        ['Unrecoverable', 22]
      ]);

    // set chart title text settings
    chart.title('Sources of energy (in ZJ)')
      //set chart radius
      .radius('43%')
      // create empty area in pie chart
      .innerRadius('30%');

    // set container id for the chart
    chart.container('3ddonut');
    // initiate chart drawing
    chart.draw();
    //for remove credit
    chart.credits().enabled(false);
});
</script>

<!-- tagcloud-->
<script type="text/javascript">
anychart.onDocumentReady(function() {
  // The data used in this sample can be obtained from the CDN
  // https://cdn.anychart.com/samples-data/tag-cloud/population-by-countries/data.json
  anychart.data.loadJsonFile('https://cdn.anychart.com/samples-data/tag-cloud/population-by-countries/data.json', function(data) {
    var dataSet = anychart.data.set(data);
    var colors = anychart.scales.ordinalColor().colors(['#26959f', '#f18126', '#3b8ad8', '#60727b', '#e24b26']);

    // create tag cloud
    chart2 = anychart.tagCloud();

    // set chart title
    chart2.title('World Population')
      // set data with settings
      .data(dataSet)
      // set color scale
      .colorScale(colors)
      // set array of angles, by which words will be placed
      .angles([-90, 0, 90]);

    // get the color range
    var colorRange = chart2.colorRange();
    // enabled color range
    colorRange
      .enabled(true)
      // sets color line size
      .colorLineSize(15);

    // set container id for the chart
    chart2.container('tagcloud');
    // initiate chart drawing
    chart2.draw();

    // save normal fill function to variable
    var normalFillFunction = chart2.fill();
    // save hover fill function to variable
    var hoveredFillFunction = chart2.hovered().fill();

    // create custom interactivity to hover colorRange
    chart2.listen('pointsHover', function(e) {
      if (e.actualTarget === colorRange) {
        // if points exist
        if (e.points.length) {
          // set settings for normal state
          chart2.normal({
            fill: 'black 0.1'
          });
          // set settings for hovered state
          chart2.hovered({
            // get fill color ratio by its number and set fill to hovered state
            fill: chart2.colorScale().valueToColor(e.point.get('category'))
          });
        } else {
          // set function for normal state
          chart2.normal({
            fill: normalFillFunction
          });
          // set function for hovered state
          chart2.hovered({
            fill: hoveredFillFunction
          });
        }
      }
    });
  });
});
</script>
