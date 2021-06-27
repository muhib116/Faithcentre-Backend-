@php
	$student_types = '';
	foreach($students as $key => $vlaue){
		$student_types .= $vlaue->id.'-'.$vlaue->type.',';
	}
@endphp


@extends('backend.master')
@section('headerTitle', 'Create Hifz Report | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.nav')
        <div class="heading">
            Create Hifz Report
		</div>
		
		<strong class="text-danger text-center" id="my_loader">Loading...</strong>
		<div>
			<div class="container_fluid">
				{!! msg($name='msg') !!}
				@if ($errors->any())
					{{ validation_msg($errors->all()) }}
				@endif

				<form action="{{ route('admin.save_new_hifzreport').get_system() }}" method="post" enctype="multipart/form-data">
					@csrf
					<div class="col-lg-10 p-0">

						<div class="form-group">
							<label class="label-control">Date</label>
							<input type="date" name="date" value="<?php echo date('Y-m-d'); ?>" class="form-control" required />
						</div>

						<div class="form-group">
							<label class="label-control">Select Student *</label>
							<select required name="student_id" id="select_student" class="form-control" onchange="verify_student_atendance(this);">
								<option value="" selected>-please select-</option>
								@if(count($students))
									@foreach($students as $key => $value)
										<option value="{{ $value->id }}">{{ $value->name }}</option>
									@endforeach
								@endif
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
										
										{{-- sabak part start here --}}
										<div class="card mb-4">
											<div class="card-header bg-danger text-light">Sabak</div>
											<div class="card-body">
												<table class="table table-bordered">
													<thead>
														<tr>
															<th>Juz</th>
															<th>Page Number</th>
															<th>Line</th>
															<th width="10">
																<button  type="button" class="btn btn-success"  onclick="clone_function('sabak')">+</button>
															</th>
														</tr>
													</thead>
													<tbody id="sabak">
														<tr>
															<td>
																<input type="number" min="1" max="30" step="1" required name="sabak_juz[]" class="form-control" placeholder="Write Juz Number">
															</td>

															<td>
																<input type="number" min="1" max="30" step="1" required name="sabak_page[]"  class="form-control" placeholder="Write Page Number">
															</td>
															<td>
																<input type="number" min="1" max="30" step="1" required name="sabak_line[]"  class="form-control" placeholder="Write Line Number">
															</td>
															<td>
																<button type="button" class="btn btn-danger" onclick="remove_tr(this)">x</button>
															</td>
														</tr>
													<tbody>
												</table>
											</div>
											<div class="card-footer text-right">
												<label style="display: inline-flex;align-items: center;gap:5px;" class="text-success">
													<input type="radio" required name="is_passed_sabak" value="1" >
													Passed
												</label>
												<label style="display: inline-flex;align-items: center;gap:5px;" class="text-danger">
													<input type="radio" required name="is_passed_sabak" value="0" >
													Failed
												</label>
											</div>
										</div>
										{{-- sabak part end here --}}

										
										{{-- seven_sabak part start here --}}
										<div class="card mb-4">
											<div class="card-header bg-primary text-light">Seven Sabak</div>
											<div class="card-body">
												<table class="table table-bordered">
													<thead>
														<tr>
															<th>Juz</th>
															<th>Page qnty</th>
															<th width="10">
																<button  type="button" class="btn btn-success"  onclick="clone_function('seven_sabak')">+</button>
															</th>
														</tr>
													</thead>
													<tbody id="seven_sabak">
														<tr>
															<td>
																<input type="number" min="1" max="30" step="1" required name="seven_sabak_juz[]" class="form-control" placeholder="Write Juz Number">
															</td>

															<td>
																<input type="number" min="1" step="1" required name="seven_sabak_page_qnty[]"  class="form-control" placeholder="Write Page Number">
															</td>
															<td>
																<button type="button" class="btn btn-danger" onclick="remove_tr(this)">x</button>
															</td>
														</tr>
													<tbody>
												</table>
											</div>
											<div class="card-footer text-right">
												<label style="display: inline-flex;align-items: center;gap:5px;" class="text-success">
													<input type="radio" required name="is_passed_seven_sabak" value="1" >
													Passed
												</label>
												&nbsp;&nbsp;
												<label style="display: inline-flex;align-items: center;gap:5px;" class="text-danger">
													<input type="radio" required name="is_passed_seven_sabak" value="0" >
													Failed
												</label>
											</div>
										</div>
										{{-- seven_sabak part end here --}}

										
										{{-- revision part start here --}}
										<div class="card mb-4">
											<div class="card-header bg-success text-light">Rivision</div>
											<div class="card-body">
												<table class="table table-bordered">
													<thead>
														<tr>
															<th>Juz</th>
															<th>Page Number <small>(From)</small></th>
															<th>Page Number <small>(To)</small></th>
															<th width="10">
																<button  type="button" class="btn btn-success"  onclick="clone_function('rivision_sabak')">+</button>
															</th>
														</tr>
													</thead>
													<tbody id="rivision_sabak">
														<tr>
															<td>
																<input type="number" min="1" max="30" step="1" required name="rivision_juz[]" class="form-control" placeholder="Write Juz Number">
															</td>
															<td>
																<input type="number" min="1" max="30" step="1" required name="rivision_page_from[]"  class="form-control" placeholder="Write Page Number">
															</td>
															<td>
																<input type="number" min="1" max="30" step="1" required name="rivision_page_to[]"  class="form-control" placeholder="Write Page Number">
															</td>
															<td>
																<button type="button" class="btn btn-danger" onclick="remove_tr(this)">x</button>
															</td>
														</tr>
													<tbody>
												</table>
											</div>
											<div class="card-footer text-right">
												<label style="display: inline-flex;align-items: center;gap:5px;" class="text-success">
													<input type="radio" required name="is_passed_rivision" value="1" >
													Passed
												</label>
												&nbsp;&nbsp;
												<label style="display: inline-flex;align-items: center;gap:5px;" class="text-danger">
													<input type="radio" required name="is_passed_rivision" value="0" >
													Failed
												</label>
											</div>
										</div>
										{{-- revision part end here --}}
									</div>
								</div>
								{{-- current sabak end --}}	




							  
								{{-- home work sabak start --}}
								<div class="card card-warning p-3 mb-3">
									<div class="card-title text-danger">
										Next Homework
									</div>

									<div>
								  		{{-- sabak part start here --}}
										<div class="card mb-4">
											<div class="card-header bg-danger text-light">Sabak</div>
											<div class="card-body">
												<table class="table table-bordered">
													<thead>
														<tr>
															<th>Juz</th>
															<th>Page Number</th>
															<th>Line</th>
															<th width="10">
																<button  type="button" class="btn btn-success"  onclick="clone_function('homework_sabak')">+</button>
															</th>
														</tr>
													</thead>
													<tbody id="homework_sabak">
														<tr>
															<td>
																<input type="number" min="1" max="30" step="1" required name="homework_sabak_juz[]" class="form-control" placeholder="Write Juz Number">
															</td>

															<td>
																<input type="number" min="1" max="30" step="1" required name="homework_sabak_page[]"  class="form-control" placeholder="Write Page Number">
															</td>
															<td>
																<input type="number" min="1" max="30" step="1" required name="homework_sabak_line[]"  class="form-control" placeholder="Write Line Number">
															</td>
															<td>
																<button type="button" class="btn btn-danger" onclick="remove_tr(this)">x</button>
															</td>
														</tr>
													<tbody>
												</table>
											</div>
										</div>
										{{-- sabak part end here --}}

										
										{{-- seven_sabak part start here --}}
										<div class="card mb-4">
											<div class="card-header bg-primary text-light">Seven Sabak</div>
											<div class="card-body">
												<table class="table table-bordered">
													<thead>
														<tr>
															<th>Juz</th>
															<th>Page qnty</th>
															<th width="10">
																<button  type="button" class="btn btn-success"  onclick="clone_function('homework_seven_sabak')">+</button>
															</th>
														</tr>
													</thead>
													<tbody id="homework_seven_sabak">
														<tr>
															<td>
																<input type="number" min="1" max="30" step="1" required name="homework_seven_sabak_juz[]" class="form-control" placeholder="Write Juz Number">
															</td>

															<td>
																<input type="number" min="1" step="1" required name="homework_seven_sabak_page_qnty[]"  class="form-control" placeholder="Write Page Number">
															</td>
															<td>
																<button type="button" class="btn btn-danger" onclick="remove_tr(this)">x</button>
															</td>
														</tr>
													<tbody>
												</table>
											</div>
										</div>
										{{-- seven_sabak part end here --}}

										
										{{-- revision part start here --}}
										<div class="card mb-4">
											<div class="card-header bg-success text-light">Rivision</div>
											<div class="card-body">
												<table class="table table-bordered">
													<thead>
														<tr>
															<th>Juz</th>
															<th>Page Number <small>(From)</small></th>
															<th>Page Number <small>(To)</small></th>
															<th width="10">
																<button  type="button" class="btn btn-success"  onclick="clone_function('homework_rivision_sabak')">+</button>
															</th>
														</tr>
													</thead>
													<tbody id="homework_rivision_sabak">
														<tr>
															<td>
																<input type="number" min="1" max="30" step="1" required name="homework_rivision_juz[]" class="form-control" placeholder="Write Juz Number">
															</td>
															<td>
																<input type="number" min="1" max="30" step="1" required name="homework_rivision_page_from[]"  class="form-control" placeholder="Write Page Number">
															</td>
															<td>
																<input type="number" min="1" max="30" step="1" required name="homework_rivision_page_to[]"  class="form-control" placeholder="Write Page Number">
															</td>
															<td>
																<button type="button" class="btn btn-danger" onclick="remove_tr(this)">x</button>
															</td>
														</tr>
													<tbody>
												</table>
											</div>
										</div>
										{{-- revision part end here --}}
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
  		th{
  			white-space: nowrap;
  		}
  		#report_container .card.card-success{
  			background-color: #ecffe1;
  		}
  		#report_container .card.card-warning{
  			background-color: #ffecec;
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