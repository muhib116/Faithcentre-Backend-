@php
	$student_types = '';
	foreach($students as $key => $vlaue){
		$student_types .= $vlaue->id.'-'.$vlaue->type.',';
	}
@endphp


@extends('backend.master')
@section('headerTitle', 'Create New Report | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.nav')
        <div class="heading">
            Create New Report
		</div>
		
		<strong class="text-danger text-center" id="my_loader">Loading...</strong>
		<div>
			<div class="container_fluid">
				{!! msg($name='msg') !!}
				@if ($errors->any())
					{{ validation_msg($errors->all()) }}
				@endif

				<form action="{{ route('admin.save_new_report').get_system() }}" method="post" enctype="multipart/form-data">
					@csrf
					<div class="col-lg-10">

						<div class="form-group">
							<label class="label-control">Date</label>
							<input type="date" name="date" value="<?php echo date('Y-m-d'); ?>" class="form-control" required />
						</div>
						
						<div class="form-group">
							<label class="label-control">Students Type *</label>
							<select name="student_type" required class="form-control" onchange="getStudents(this.value)">
								<option value="" selected>-select type-</option>
								@foreach(student_type() as $type)
									@if($type != 'hifz')
										<option value="{{$type}}">{{ ucfirst($type) }}</option>
									@endif
								@endforeach
							</select>
						</div>

						<div class="form-group">
							<label class="label-control">Select Student *</label>
							<select required name="student_id" id="select_student" class="form-control" onchange="handleReport(this); verify_student_atendance(this);">
								<option value="" selected>-please select-</option>
							</select>
						</div>

						<div class="form-group">
							<label class="label-control">Status *</label>

							<div style="display:flex; gap:15px; flex-wrap: wrap; align-items:center;" class="form-control">
								<label style="display: flex;align-items: center;gap:5px;">
									<input type="radio" required name="student_status" value="present" onclick="handleStudentStatus(this)">
									Present
								</label>
								<label style="display: flex;align-items: center;gap:5px;">
									<input type="radio" required name="student_status" value="absent" onclick="handleStudentStatus(this)">
									Absent
								</label>
								<label style="display: flex;align-items: center;gap:5px;">
									<input type="radio" required name="student_status" value="late" onclick="handleStudentStatus(this)">
									Late
								</label>
								<label style="display: flex;align-items: center;gap:5px;">
									<input type="radio" required name="student_status" value="interrupted" onclick="handleStudentStatus(this)">
									Interrupted
								</label>
							</div>
						</div>


						<div id="report_container">
							<div class="form-group">
									
								{{-- current sabak start --}}
								<div class="card card-success p-3 mb-3">
									<div class="card-title text-success">
										Done today
									</div>

									<div>
										<div id="report">
											{{-- comming according student type by javascript --}}
										</div>

										<div class="form-group">
											<label class="label-control">Memorizing *</label>
											<textarea name="memorizing" required class="form-control" rows="2" placeholder="Write..."></textarea>
										</div>
										<div class="form-group">
											<label class="label-control">Tajwid *</label>
											<textarea name="tajwid" required class="form-control" rows="2" placeholder="Write..."></textarea>
										</div>
										<div class="form-group">
											<label class="label-control">Handwriting *</label>
											<textarea name="handwriting" required class="form-control" rows="2" placeholder="Write..."></textarea>
										</div>
									</div>
								</div>
								{{-- current sabak end --}}	

							  
								{{-- home work sabak start --}}
								<div class="card card-warning p-3 mb-3">
									<div class="card-title text-danger">
										Next Homework
									</div>

									<div>
								  		<div id="home_work_report">
											{{-- comming according student type by javascript --}}
										</div>

										<div class="form-group">
											<label class="label-control">Memorizing Home Work *</label>
											<textarea name="home_work_memorizing" required class="form-control" rows="2" placeholder="Write..."></textarea>
										</div>
										<div class="form-group">
											<label class="label-control">Tajwid Home Work *</label>
											<textarea name="home_work_tajwid" required class="form-control" rows="2" placeholder="Write..."></textarea>
										</div>
										<div class="form-group">
											<label class="label-control">Handwriting Home Work *</label>
											<textarea name="home_work_handwriting" required class="form-control" rows="2" placeholder="Write..."></textarea>
										</div>
									</div>
								</div>
								{{-- home work sabak end --}}

							</div>

							<div class="form-group">
								<label class="label-control">Remark (<small>optional</small>)</label>
								<textarea name="remark" class="form-control" rows="5"></textarea>
							</div>

							<div class="form-group">
								<label class="label-control">Star achieved today (<small>optional</small>)</label>
								<div class="form-group">
									<label class="text-danger">
										<input type="radio" name="star" value="0" required> 0 star &nbsp;
									</label>
									<label class="text-primary">
										<input type="radio" name="star" value="1" required> 1 star &nbsp;
									</label>
									<label class="text-success">
										<input type="radio" name="star" value="2" required>
										2 star
									</label>
								</div>
							</div>

							<input type="submit" class="btn btn-primary" value="Create">
						</div>
					</div>
					
				</form>

			</div>
		</div>
    </section>
@endsection



@push('css')
  	<style>
  		#report_container .card.card-success{
  			background-color: #fafff7;
  		}
  		#report_container .card.card-warning{
  			background-color: #fff7f7;
  		}
  		#report_container .card .card-title{
  			font-size: 17px !important;
  		}
  		#report_container .card :is(input, textarea){
  			background-color: transparent;
  		}

		.cke_contents.cke_reset{
			height: 400px !important;
		}
		
		#my_loader{
			display: none;
		}
	</style>
@endpush


@push('js')
	
	{{-- get student according to type start --}}
	<script>
		async function getStudents(studentType)
		{
			let url 		   = "{{ route('admin.getStudents') }}/"+studentType;
			let select_student = document.getElementById('select_student');
			let my_loader 	   = document.getElementById('my_loader');

			my_loader.style.display = 'block';
			

			let response = await fetch(url);
			let data     = await response.json();
			let options  = `<option value=''>-please select-</option>`;

			for([key, value] of Object.entries(data))
			{
				options += `<option value="${value.id}">${value.name}</option>`;
			}

			select_student.innerHTML = options;
			my_loader.style.display  = '';
		}
	</script>
	{{-- get student according to type start --}}



	{{-- student handler start --}}
	<script>
		let report_container = document.getElementById('report_container');
		let my_loader 	     = document.getElementById('my_loader');

		function handleStudentStatus(x){
			if(x.value=='absent'){
				report_container.style.display = 'none';
			}else{
				report_container.style.display = '';
			}
		}

		/* **
		/* students authentication verification
		/* verify that this verification already taken or not 
		* **/
		async function verify_student_atendance(x)
		{
			
			let student_id = x.value;

			if(student_id.length>0)
			{
				my_loader.style.display = 'block';
				
				let response = await fetch("{{route('admin.attendance_verifications')}}/"+student_id);
				let data     = await response.json();
				
				if(response.ok)
				{
					my_loader.style.display = 'none';
				}

				if(JSON.parse(data))
				{
					report_container.style.display = 'none';
					alert("Report already created!");
				}else{
					report_container.style.display = '';
				}
			}else{
				alert("Please select at least one student!");
			}
		}
	</script>
	{{-- student handler end --}}


	{{-- report section handler start --}}
	<script>
		function handleReport(x)
		{
			const studentsType  = "{{$student_types}}".replace(/\,+$/g, '');
			let studentsTypeArr = studentsType.split(',');
			let student_id 		= x.value;
			let filteredStudent = studentsTypeArr.filter(student=>student.indexOf(student_id+'-')===0);
			let studentType     = '';
			let report 			= document.getElementById('report');

			if(filteredStudent.length>0)
			{
				studentType = filteredStudent.toString().replace(student_id+'-', '').toLowerCase();
			}

			let response = '';
			switch(studentType)
			{
				case 'qaidah':
					response = `<div class="form-group">
									<label class="label-control">Qaidah *</label>
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>Page</th>
												<th>Start (<small>Box</small>)</th>
												<th>End (<small>Box</small>)</th>
												<th width="10">
													<button  type="button" class="btn btn-success"  onclick="clone_function('ajker_pora')">+</button>
												</th>
											</tr>
										</thead>

										<tbody id="ajker_pora">
											<tr>
												<td>
													<input type="number" min="1" step="1" required name="page_or_sura[]" class="form-control" placeholder="Write page number">
												</td>
												<td>
													<input type="number" min="1" step="1" required name="from[]" class="form-control" placeholder="Write box number">
												</td>
												<td>
													<input type="number" min="1" step="1" required name="to[]" class="form-control" placeholder="Write box number">
												</td>
												<td>
													<button type="button" class="btn btn-danger" onclick="remove_tr(this)">x</button>
												</td>
											</tr>
										<tbody>
									</table>
								</div>`;
								break;


				case 'juz amma':
					response = `<div class="form-group">
									<label class="label-control">Juz Amma *</label>
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>Sura</th>
												<th>Start (<small>Ayat</small>)</th>
												<th>End (<small>Ayat</small>)</th>
												<th width="10">
													<button  type="button" class="btn btn-success"  onclick="clone_function('ajker_pora')">+</button>
												</th>
											</tr>
										</thead>

										<tbody id="ajker_pora">
											<tr>
												<td>
													<input type="text" list="juz_ammah_sura" required name="page_or_sura[]" class="form-control" placeholder="Write sura name">
													<datalist id="juz_ammah_sura">
														@foreach(juz_amma_suras() as $sura)
															<option value="{{ucfirst($sura)}}" />
														@endforeach
													</datalist>
												</td>
												<td>
													<input type="number" min="1" step="1" required name="from[]" class="form-control" placeholder="Write box number">
												</td>
												<td>
													<input type="number" min="1" step="1" required name="to[]" class="form-control" placeholder="Write box number">
												</td>
												<td>
													<button type="button" class="btn btn-danger" onclick="remove_tr(this)">x</button>
												</td>
											</tr>
										<tbody>
									</table>
								</div>`;
								break;


				case 'quran':
					response = `<div class="form-group">
									<label class="label-control">Quran *</label>
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>Sura</th>
												<th>Start (<small>Ayat</small>)</th>
												<th>End (<small>Ayat</small>)</th>
												<th width="10">
													<button  type="button" class="btn btn-success"  onclick="clone_function('ajker_pora')">+</button>
												</th>
											</tr>
										</thead>

										<tbody id="ajker_pora">
											<tr>
												<td>
													<input type="text" list="quran_sura" required name="page_or_sura[]" class="form-control" placeholder="Write sura name">
													<datalist id="quran_sura">
														@foreach(quran_suras() as $sura)
															<option value="{{ucfirst($sura)}}" />
														@endforeach
													</datalist>
												</td>
												<td>
													<input type="number" min="1" step="1" required name="from[]" class="form-control" placeholder="Write box number">
												</td>
												<td>
													<input type="number" min="1" step="1" required name="to[]" class="form-control" placeholder="Write box number">
												</td>
												<td>
													<button type="button" class="btn btn-danger" onclick="remove_tr(this)">x</button>
												</td>
											</tr>
										<tbody>
									</table>
								</div>`;
								break;

				default: 
					response = '';
					break;
			}

			report.innerHTML 	   = response;

			handleHomeWorkReport(studentType);
		}

		function handleHomeWorkReport(studentType)
		{
			let home_work_report= document.getElementById('home_work_report');


			let response = '';
			switch(studentType)
			{
				case 'qaidah':
					response = `<div class="form-group">
									<label class="label-control">Qaidah *</label>
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>Page</th>
												<th>Start (<small>Ayat/Box</small>)</th>
												<th>End (<small>Ayat/Box</small>)</th>
												<th width="10">
													<button  type="button" class="btn btn-success"  onclick="clone_function('kalker_pora')">+</button>
												</th>
											</tr>
										</thead>

										<tbody id="kalker_pora">
											<tr>
												<td>
													<input type="number" min="1" step="1" required name="home_work_page_or_sura[]" class="form-control" placeholder="Write page number">
												</td>
												<td>
													<input type="number" min="1" step="1" required name="home_work_from[]" class="form-control" placeholder="Write box number">
												</td>
												<td>
													<input type="number" min="1" step="1" required name="home_work_to[]" class="form-control" placeholder="Write box number">
												</td>
												<td>
													<button type="button" class="btn btn-danger" onclick="remove_tr(this)">x</button>
												</td>
											</tr>
										<tbody>
									</table>
								</div>`;
								break;


				case 'juz amma':
					response = `<div class="form-group">
									<label class="label-control">Juz Amma *</label>
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>Sura</th>
												<th>Start (<small>Ayat</small>)</th>
												<th>End (<small>Ayat</small>)</th>
												<th width="10">
													<button  type="button" class="btn btn-success"  onclick="clone_function('kalker_pora')">+</button>
												</th>
											</tr>
										</thead>

										<tbody id="kalker_pora">
											<tr>
												<td>
													<input type="text" list="juz_ammah_sura" required name="home_work_page_or_sura[]" class="form-control" placeholder="Write sura name">
													<datalist id="juz_ammah_sura">
														@foreach(juz_amma_suras() as $sura)
															<option value="{{ucfirst($sura)}}" />
														@endforeach
													</datalist>
												</td>
												<td>
													<input type="number" min="1" step="1" required name="home_work_from[]" class="form-control" placeholder="Write ayat number">
												</td>
												<td>
													<input type="number" min="1" step="1" required name="home_work_to[]" class="form-control" placeholder="Write ayat number">
												</td>
												<td>
													<button type="button" class="btn btn-danger" onclick="remove_tr(this)">x</button>
												</td>
											</tr>
										<tbody>
									</table>
								</div>`;
								break;


				case 'quran':
					response = `<div class="form-group">
									<label class="label-control">Quran *</label>
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>Sura</th>
												<th>Start (<small>Ayat</small>)</th>
												<th>End (<small>Ayat</small>)</th>
												<th width="10">
													<button  type="button" class="btn btn-success"  onclick="clone_function('kalker_pora')">+</button>
												</th>
											</tr>
										</thead>

										<tbody id="kalker_pora">
											<tr>
												<td>
													<input type="text" list="quran_sura" required name="home_work_page_or_sura[]" class="form-control" placeholder="Write sura name">
													<datalist id="quran_sura">
														@foreach(quran_suras() as $sura)
															<option value="{{ucfirst($sura)}}" />
														@endforeach
													</datalist>
												</td>
												<td>
													<input type="number" min="1" step="1" required name="home_work_from[]" class="form-control" placeholder="Write ayat number">
												</td>
												<td>
													<input type="number" min="1" step="1" required name="home_work_to[]" class="form-control" placeholder="Write ayat number">
												</td>
												<td>
													<button type="button" class="btn btn-danger" onclick="remove_tr(this)">x</button>
												</td>
											</tr>
										<tbody>
									</table>
								</div>`;
								break;

				default: 
					response = '';
					break;
			}

			home_work_report.innerHTML 	   = response;
		}
	</script>
	{{-- report section handler end --}}


    {{-- dynamic table raw add and remove start --}}
	    <script>
	    	function clone_function(item_container){
			  	var	item_container = document.getElementById(item_container),
					    clone      = item_container.lastElementChild;
			  
				clone = clone.cloneNode(true);
				item_container.appendChild(clone);

				var lastChild_children = item_container.lastElementChild.children,
					_length              = lastChild_children.length-1,
					i                    = 0;

				for(i; i<_length; i++){
					lastChild_children[i].children[0].value='';
				}
			}

			function remove_tr(This) {
			    if(This.closest('tbody').childElementCount == 1)
			    {
			        alert("You Don't have Permission to Delete This ?");
			    }else{
			        This.closest('tr').remove();
			    }
			}function clone_function(item_container){
			  	var	item_container = document.getElementById(item_container),
					    clone          = item_container.lastElementChild;
			  
						clone = clone.cloneNode(true);
						item_container.appendChild(clone);

						var lastChild_children = item_container.lastElementChild.children,
							_length              = lastChild_children.length-1,
							i                    = 0;

						for(i; i<_length; i++){
							lastChild_children[i].children[0].value='';
						}
			}

			function remove_tr(This) {
			    if(This.closest('tbody').childElementCount == 1)
			    {
			        alert("You Don't have Permission to Delete This ?");
			    }else{
			        This.closest('tr').remove();
			    }
			}
	    </script>
    {{-- dynamic table raw add and remove end --}}
@endpush