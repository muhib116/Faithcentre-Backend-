@extends('backend.master')
@section('headerTitle', 'Dashboard')


@section('content')
    <section class="content">
    	<div class="banner">
    		Welcome To {{ $site_name }}
    	</div>
    	
        {{-- <div class="heading">
            Dashboard
        </div> --}}
		

		<div class="my_container">
			<div class="task_list">
				<h3>Task List</h3>
				<p>
					Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
				</p>
			</div>

			<div class="recent_celebrations">
				<h3>Recently Celebrations</h3>
				<p>
					Lorem Ipsum is simply dummy text of the printing and typesetting industry.
				</p>
				<p>
					Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown prin scrambled it to make a type specimen book.
				</p>

				<p>
					It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. 
				</p>
				<p>
					It was popularised in the 1960s and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
				</p>
			</div>

			<div class="calendar_container">
				<h3>Calendar</h3>

				<div class="wraper">
					<div class="cal_one">
						<div class="calendar">
						  <div class="calendar__picture">
						  	<strong>Upcoming Month-1</strong>
						    <h3>18, Sunday</h3>
						    <h4>April</h4>
						  </div>
						  <div class="calendar__date">
						    <div class="calendar__day">M</div>
						    <div class="calendar__day">T</div>
						    <div class="calendar__day">W</div>
						    <div class="calendar__day">T</div>
						    <div class="calendar__day">F</div>
						    <div class="calendar__day">S</div>
						    <div class="calendar__day">S</div>
						    <div class="calendar__number"></div>
						    <div class="calendar__number"></div>
						    <div class="calendar__number"></div>
						    <div class="calendar__number">1</div>
						    <div class="calendar__number">2</div>
						    <div class="calendar__number">3</div>
						    <div class="calendar__number">4</div>
						    <div class="calendar__number">5</div>
						    <div class="calendar__number">6</div>
						    <div class="calendar__number">7</div>
						    <div class="calendar__number">8</div>
						    <div class="calendar__number">9</div>
						    <div class="calendar__number">10</div>
						    <div class="calendar__number">11</div>
						    <div class="calendar__number">12</div>
						    <div class="calendar__number">13</div>
						    <div class="calendar__number">14</div>
						    <div class="calendar__number">15</div>
						    <div class="calendar__number">16</div>
						    <div class="calendar__number">17</div>
						    <div class="calendar__number calendar__number--current">18</div>
						    <div class="calendar__number">19</div>
						    <div class="calendar__number">20</div>
						    <div class="calendar__number">21</div>
						    <div class="calendar__number">22</div>
						    <div class="calendar__number">23</div>
						    <div class="calendar__number">24</div>
						    <div class="calendar__number">25</div>
						    <div class="calendar__number">26</div>
						    <div class="calendar__number">27</div>
						    <div class="calendar__number">28</div>
						    <div class="calendar__number">29</div>
						    <div class="calendar__number">30</div>
						  </div>
						</div>
					</div>
					<div class="cal_two">
						<div class="calendar">
						  <div class="calendar__picture">
						  	<strong>Upcoming Month-2</strong>
						    <h3>10, Sunday</h3>
						    <h4>May</h4>
						  </div>
						  <div class="calendar__date">
						    <div class="calendar__day">M</div>
						    <div class="calendar__day">T</div>
						    <div class="calendar__day">W</div>
						    <div class="calendar__day">T</div>
						    <div class="calendar__day">F</div>
						    <div class="calendar__day">S</div>
						    <div class="calendar__day">S</div>
						    <div class="calendar__number"></div>
						    <div class="calendar__number"></div>
						    <div class="calendar__number"></div>
						    <div class="calendar__number">1</div>
						    <div class="calendar__number">2</div>
						    <div class="calendar__number">3</div>
						    <div class="calendar__number">4</div>
						    <div class="calendar__number">5</div>
						    <div class="calendar__number">6</div>
						    <div class="calendar__number">7</div>
						    <div class="calendar__number">8</div>
						    <div class="calendar__number">9</div>
						    <div class="calendar__number calendar__number--current">10</div>
						    <div class="calendar__number">11</div>
						    <div class="calendar__number">12</div>
						    <div class="calendar__number">13</div>
						    <div class="calendar__number">14</div>
						    <div class="calendar__number">15</div>
						    <div class="calendar__number">16</div>
						    <div class="calendar__number">17</div>
						    <div class="calendar__number">18</div>
						    <div class="calendar__number">19</div>
						    <div class="calendar__number">20</div>
						    <div class="calendar__number">21</div>
						    <div class="calendar__number">22</div>
						    <div class="calendar__number">23</div>
						    <div class="calendar__number">24</div>
						    <div class="calendar__number">25</div>
						    <div class="calendar__number">26</div>
						    <div class="calendar__number">27</div>
						    <div class="calendar__number">28</div>
						    <div class="calendar__number">29</div>
						    <div class="calendar__number">30</div>
						  </div>
						</div>
					</div>
				</div>
			</div>
		</div>
		  

        <div class="dashboard_box_container">
		 <!------------------------------------------------------------>
		  {{-- <div class="db-box">
		    <div class="icon">
		      <img src="{{ asset("public/backend/images/svgicon/users.svg") }}" alt="">
		    </div>

		    <div>
		      <h3>250</h3>
		      <small>Total Customer</small>
		      <a href="#">Customer List</a>
		    </div>
		  </div> --}}
		  <!------------------------------------------------------------>
		  

		  <!------------------------------------------------------------>
		  {{-- <div class="db-box">
		    <div class="icon">
		      <img src="{{ asset("public/backend/images/svgicon/users.svg") }}" alt="">
		    </div>

		    <div>
		      <h3>50</h3>
		      <small>Upcoming Birthday</small>
		      <a href="#">Birthday List</a>
		    </div>
		  </div> --}}
		  <!------------------------------------------------------------>

		  <!------------------------------------------------------------>
		  {{-- <div class="db-box">
		    <div class="icon">
		      <img src="{{ asset("public/backend/images/svgicon/users.svg") }}" alt="">
		    </div>

		    <div>
		      <h3>34</h3>
		      <small>Pending Campaings</small>
		      <a href="#">Campaings List</a>
		    </div>
		  </div> --}}
		  <!------------------------------------------------------------>

		  {{--  <!------------------------------------------------------------>
		  <div class="db-box">
		    <div class="icon">
		      <img src="{{ asset("public/backend/images/svgicon/instock-2.svg") }}" alt="">
		    </div>
		    
		    <div>
		      <h3>{{$available_stock}}</h3>
		      <small>Available in stock</small>
		      <a href="{{ url('available_stock?system=NjlfOTU=') }}">Stock List</a>
		    </div>
		  </div>
		  <!------------------------------------------------------------>
		  

		  <!------------------------------------------------------------>
		  <div class="db-box">
		    <div class="icon">
		      <img src="{{ asset("public/backend/images/svgicon/emptybox.svg") }}" alt="">
		    </div>
		    
		    <div>
		      <h3>{{$out_of_stock}}</h3>
		      <small>Out of stock</small>
		      <a href="{{ url("stock_out?system=NjlfOTM=") }}">Stock Out List</a>
		    </div>
		  </div>
		  <!------------------------------------------------------------>
		  

		  <!------------------------------------------------------------>
		  <div class="db-box">
		    <div class="icon">
		      <img src="{{ asset("public/backend/images/svgicon/medicine.svg") }}" alt="">
		    </div>
		    
		    <div>
		      <h3>{{$total_products}}</h3>
		      <small>Total Medicine</small>
		      <a href="{{ url("medicine?system=NjRfNzg=") }}">Medicin List</a>
		    </div>
		  </div>
		  <!------------------------------------------------------------>
		  

		  <!------------------------------------------------------------>
		  <div class="db-box">
		    <div class="icon">
		      <img src="{{ asset("public/backend/images/svgicon/medicine.svg") }}" alt="">
		    </div>
		    
		    <div>
		      <h3>{{$expired}}</h3>
		      <small>Total Expired</small>
		      <a href="{{ url("expired?system=NjlfOTQ=") }}">Expired List</a>
		    </div>
		  </div>
		  <!------------------------------------------------------------>
		  

		  <!------------------------------------------------------------>
		  <div class="db-box">
		    <div class="icon">
		      <img src="{{ asset("public/backend/images/svgicon/layer.svg") }}" alt="">
		    </div>

		    <div>
		      <h3>{{$total_whole_sale}}</h3>
		      <small>Total Whole Sale</small>
		      <a href="{{ url("sale-report?system=NjlfOTI=") }}">Sale Report</a>
		    </div>
		  </div>
		  <!------------------------------------------------------------>
		  

		  <!------------------------------------------------------------>
		  <div class="db-box">
		    <div class="icon">
		      <img src="{{ asset("public/backend/images/svgicon/layer.svg") }}" alt="">
		    </div>

		    <div>
		      <h3>{{$total_retail_sale}}</h3>
		      <small>Total Retail Sale</small>
		      <a href="{{ url("sale-report?system=NjlfOTI=") }}">Sale Report</a>
		    </div>
		  </div>
		  <!------------------------------------------------------------>
		  

		</div>


		<br>
		<br>
		<div class="row">
			<div class="col-md-6 mb-4">
				<div class="card">
					<div class="card-header">
						Stock 
					</div>
					<div class="card-body table-responsive">
						<canvas id="myStockChart"></canvas>
					</div>
				</div>
			</div>

			<div class="col-md-6 mb-4">
				<div class="card">
					<div class="card-header">
						Today's Report
					</div>
					<div class="card-body table-responsive">
						<canvas id="myOtherChart"></canvas>
					</div>
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col-md-6 mb-4">
				<div class="card">
					<div class="card-header">
						Monthly Whole Sale Progress Report
					</div>
					<div class="card-body table-responsive">
						<canvas id="myChart_1" width="400px" height="300px"></canvas>
					</div>
				</div>
			</div>

			<div class="col-md-6 mb-4">
				<div class="card">
					<div class="card-header">
						Monthly Retail Sale Progress Report
					</div>
					<div class="card-body table-responsive">
						<canvas id="myChart_2" width="400px" height="300px"></canvas>
					</div>
				</div>
			</div>
		</div> --}}
		



    </section>
@endsection


@push('css')
	<style>
		.banner{
			font-size: 35px;
		    color: #fff;
		    font-weight: bold;
		    display: grid;
		    place-content: center;
		    padding: 0 25px;
			margin-bottom: 15px;
		    height: 80px;
		    background: linear-gradient(45deg, #6b1b98, #b61c1d);
		    font-family: 'Josefin Sans';
		}

		.my_container{
			display: grid;
    		grid-template-columns: 1fr 1fr;
    		grid-template-areas: 
    			"task cal"
    			"celeb cal"
    		;
    		gap: 15px;
		}
		.my_container>*{
			border: 1px solid #0004;
			padding: 15px;
		}
		.my_container>*>h3{
			margin: 0;
		    margin-bottom: 15px;
		    text-align: center;
		    border-bottom: 1px solid #0004;
		    padding-bottom: 10px;
		    font-size: 18px;
		}

		.task_list{
			grid-area: task;
		}
		.calendar_container{
			grid-area: cal;
		}
		.recent_celebrations{
			grid-area: celeb;
		}

		.calendar_container .wraper{
			display: grid;
			grid-template-columns: 1fr 1fr;
    		gap: 20px;
		}


		/*-----------------------------------------------*/
		.calendar {
			 position: relative;
			 width: 100%;
			 background-color: #fff;
			 box-sizing: border-box;
			 /*border-radius: 8px;*/
			 box-shadow: 0 2px 20px rgba(0, 0, 0, 0.2);
			 overflow: hidden;
			 margin-bottom: 25px;
			 border: 1px solid #0003;
		}
		 .calendar__picture {
			 position: relative;
			 height: 200px;
			 padding: 20px;
			 color: #fff;
			 background: #262626 url("https://images.unsplash.com/photo-1516912481808-3406841bd33c?ixlib=rb-0.3.5&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE0NTg5fQ&s=183f2924ba5a8429441804609b2d4f61") no-repeat center / cover;
			 text-shadow: 0 2px 2px rgba(0, 0, 0, 0.2);
			 box-sizing: border-box;
		}
		 .calendar__picture::before {
			 content: "";
			 left: 0;
			 right: 0;
			 top: 0;
			 bottom: 0;
			 position: absolute;
			 background: linear-gradient(to top, rgba(0, 0, 0, 0.25), rgba(0, 0, 0, 0.1));
		}
		 .calendar__picture h2 {
			 margin: 0;
		}
		 .calendar__picture h3 {
			 margin: 0;
			 font-weight: 500;
		}
		 .calendar__date {
			padding: 15px;
		    display: grid;
		    grid-template-columns: repeat(7, minmax(25px, 1fr));
		    grid-template-rows: repeat(6, minmax(39px, 1fr));
		    place-content: center;
		    grid-gap: 10px;
		    box-sizing: border-box;
		    align-items: center;
		    justify-content: center;
		}
		 .calendar__day {
			 display: flex;
			 align-items: center;
			 justify-content: center;
			 height: 25px;
			 font-weight: 600;
			 color: #262626;
		}
		 .calendar__day:nth-child(7) {
			 color: #ff685d;
		}
		 .calendar__number {
			 display: flex;
			 align-items: center;
			 justify-content: center;
			 height: 25px;
			 color: #262626;
		}
		 .calendar__number:nth-child(7n) {
			 color: #ff685d;
			 font-weight: 700;
		}
		 .calendar__number--current, .calendar__number:hover {
			 background-color: #009688;
			 color: #fff !important;
			 font-weight: 700;
			 cursor: pointer;
		}
		 
	</style>
@endpush

@push('js')
@endpush