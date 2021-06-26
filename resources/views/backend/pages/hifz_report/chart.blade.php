@push('css')
  <link
    rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
    integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
    crossorigin="anonymous"
  />
  <style>
    .header_bar {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 15px;
    }

    .header_bar select {
      width: fit-content;
    }

    .my_tab_bar a {
      color: #999;
    }

    .my_tab_bar a strong {
      font-size: 20px;
      display: block;
      text-align: center;
    }

    .chart {
      height: 200px;
    }
  </style>
@endpush



<div class="panel panel-default">
  <div class="panel-heading">
    <div class="header_bar">
      <h3 class="panel-title">Analytics</h3>

      <form action="{{ route('admin.overview_report') }}" style="display: flex;align-items: center;gap: 5px;">
        <input type="hidden" name="system" value="MTA5XzE4MA==">
        <select class="form-control" name="filter_data">
          <option {{ isset($_GET['filter_data']) &&  $_GET['filter_data'] == 'date:'.date('Y-m-d') ? 'selected' : '' }} value="{{ 'date:'.date('Y-m-d') }}">Today</option>
          <option {{ isset($_GET['filter_data']) &&  $_GET['filter_data'] == 'date:'.extendDateOrTime(date('Y-m-d'), "-7 days") ? 'selected' : '' }} value="{{ 'date:'.extendDateOrTime(date('Y-m-d'), "-7 days") }}">Last 7 Days</option>
          <option {{ !isset($_GET['filter_data']) ||  $_GET['filter_data'] == 'date:'.extendDateOrTime(date('Y-m-d'), "-28 days") ? 'selected' : '' }} value="{{ 'date:'.extendDateOrTime(date('Y-m-d'), "-28 days") }}">Last 28 Days</option>
          <option {{ isset($_GET['filter_data']) &&  $_GET['filter_data'] == 'date:'.extendDateOrTime(date('Y-m-d'), "-90 days") ? 'selected' : '' }} value="{{ 'date:'.extendDateOrTime(date('Y-m-d'), "-90 days") }}">Last 90 Days</option>
          <option {{ isset($_GET['filter_data']) &&  $_GET['filter_data'] == 'all' ? 'selected' : '' }} value="all">Lifetime</option>

          <option {{ isset($_GET['filter_data']) &&  $_GET['filter_data'] == 'y:'.date('Y') ? 'selected' : '' }} value="{{ 'y:'.date('Y') }}">
            {{ date('Y') }}
          </option>
          
          <option {{ isset($_GET['filter_data']) &&  $_GET['filter_data'] == 'y:'.date("Y", strtotime(extendDateOrTime(date('Y-m-d'), "-1 year"))) ? 'selected' : '' }} value="{{ 'y:'.date("Y", strtotime(extendDateOrTime(date('Y-m-d'), "-1 year"))) }}">
            {{ date("Y", strtotime(extendDateOrTime(date('Y-m-d'), "-1 year"))) }}
          </option>
          
          <option {{ isset($_GET['filter_data']) &&  $_GET['filter_data'] == 'y:'.date("Y", strtotime(extendDateOrTime(date('Y-m-d'), "-2 year"))) ? 'selected' : '' }} value="{{ 'y:'.date("Y", strtotime(extendDateOrTime(date('Y-m-d'), "-2 year"))) }}">
            {{ date("Y", strtotime(extendDateOrTime(date('Y-m-d'), "-2 year"))) }}
          </option>

          <option {{ isset($_GET['filter_data']) &&  $_GET['filter_data'] == 'm:'.date("m") ? 'selected' : '' }} value="{{ 'm:'.date("m") }}">
            <?php echo date("M"); ?>
          </option>
          
          <option {{ isset($_GET['filter_data']) &&  $_GET['filter_data'] == 'm:'.date("m", strtotime(extendDateOrTime(date('Y-m-d'), "-1 month"))) ? 'selected' : '' }} value="{{ 'm:'.date("m", strtotime(extendDateOrTime(date('Y-m-d'), "-1 month"))) }}">
            {{ date("M", strtotime(extendDateOrTime(date('Y-m-d'), "-1 month"))) }}
          </option>
          
          <option {{ isset($_GET['filter_data']) &&  $_GET['filter_data'] == 'm:'.date("m", strtotime(extendDateOrTime(date('Y-m-d'), "-2 month"))) ? 'selected' : '' }} value="{{ 'm:'.date("m", strtotime(extendDateOrTime(date('Y-m-d'), "-2 month"))) }}">
            {{ date("M", strtotime(extendDateOrTime(date('Y-m-d'), "-2 month"))) }}
          </option>
        </select>

        <input class="btn btn-primary" type="submit" value="Filter">
      </form>
    </div>
  </div>


  <div class="panel-body">    
    <canvas
      class="chart"
      id="academicChart"
      style="background-color: #f8f8f8"
      height="100"
    ></canvas>
  </div>
</div>



@push('js')
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
  <script>
    var ctx    = document.getElementById('academicChart').getContext('2d');

    /*ganaret x-exis label by date start*/
      var labelX = "{{ $label_data }}".split(';');
    /*ganaret x-exis label by date end*/

    /*total academicChart start*/
    let academicChart    = "{{ $chart_data }}".split(';'),
        bgColor     = [],
        borderColor = [];

      academicChart.map(_x=>{

        /*generat color start*/
        bgColor.push(`rgba(${Math.floor(Math.random() * 256)}, ${Math.floor(Math.random() * 256)}, ${Math.floor(Math.random() * 256)}, ${Math.random()}`);
        borderColor.push(`rgb(${Math.floor(Math.random() * 256)}, ${Math.floor(Math.random() * 256)}, ${Math.floor(Math.random() * 256)}`);
        /*generat color end*/
      });
    /*total academicChart end*/

    var myChart = new Chart(ctx, {
        type: 'line',//line|bar|radar|polarArea|bubble|scatter|doughnut
        data: {
          labels: labelX.reverse(),
          datasets: [{
              label: 'Academic Data',
              data: academicChart.reverse(),
              // backgroundColor: ['rgba(255, 159, 64, 0.2)'],
              // borderColor: ['rgba(255, 159, 64, 1)'],
              // backgroundColor: bgColor,
              backgroundColor: "#fe990033",
              borderColor: borderColor,
              borderWidth: 1
          }],
          fill: false,
        },
        options: {
          responsive: true,
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
  </script>


  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <!-- Latest compiled and minified JavaScript -->
  <script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
    integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
    crossorigin="anonymous"
  ></script>
@endpush