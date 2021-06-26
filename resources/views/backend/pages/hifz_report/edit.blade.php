@php
	$student_types = '';
	foreach($students as $key => $value){
		$student_types .= $value->id.'-'.$value->type.',';
	}
@endphp


@extends('backend.master')
@section('headerTitle', 'Update Hifz Report | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.nav')
        <div class="heading">
            Update Hifz Report
		</div>
		
		@if($result)
			<strong class="text-warning text-center" id="my_loader">Loading...</strong>
			<div>
				<div class="container_fluid">
					{!! msg($name='msg') !!}
					@if ($errors->any())
						{{ validation_msg($errors->all()) }}
					@endif

					<form action="{{ route('admin.update_process_hifzreport', $result->id).get_system() }}" method="post" enctype="multipart/form-data">
						@csrf
						<div class="col-lg-10">

							<div class="form-group">
								<label class="label-control">Date</label>
								<input type="date" name="date" value="{{ $result->date }}" class="form-control" />
							</div>
						
							<div class="form-group">
								<label class="label-control">Students Type *</label>
								<select name="student_type" required class="form-control" onchange="getStudents(this.value)" readonly>
									<option value="" selected>-select type-</option>
									@foreach(student_type() as $type)
										<option {{ ($result->student_type === $type) ? 'selected' : '' }} value="{{$type}}">{{ ucfirst($type) }}</option>
									@endforeach
								</select>
							</div>

							<div class="form-group">
								<label class="label-control">Select Student *</label>
								<select required name="student_id" id="select_student" class="form-control" readonly>
									<option value="">-please select-</option>

									@foreach($students as $key => $value)
										<option {{ ($result->student_id === $value->id) ? 'selected' : '' }} value="{{ $value->id }}">{{ $value->name }} ({{ $value->type }})</option>
									@endforeach
								</select>
							</div>

							<div class="form-group">
								<label class="label-control">Status *</label>

								<div style="display:flex; gap:15px; flex-wrap: wrap; align-items:center;" class="form-control">
									<label style="display: flex;align-items: center;gap:5px;">
										<input type="radio" {{ ($result->student_status == 'present') ? 'checked' : '' }} required name="student_status" value="present" onclick="handleStudentStatus(this)">
										Present
									</label>
									<label style="display: flex;align-items: center;gap:5px;">
										<input type="radio" {{ ($result->student_status == 'absent') ? 'checked' : '' }} required name="student_status" value="absent" onclick="handleStudentStatus(this)">
										Absent
									</label>
									<label style="display: flex;align-items: center;gap:5px;">
										<input type="radio" {{ ($result->student_status == 'late') ? 'checked' : '' }} required name="student_status" value="late" onclick="handleStudentStatus(this)">
										Late
									</label>
									<label style="display: flex;align-items: center;gap:5px;">
										<input type="radio" {{ ($result->student_status == 'interrupted') ? 'checked' : '' }} required name="student_status" value="interrupted" onclick="handleStudentStatus(this)">
										Interrupted
									</label>
								</div>
							</div>



							<div id="report_container">
									

								{{-- current sabak start --}}
									<div class="card card-success p-3 mb-3">
										<div class="card-title text-success">
											Done today
										</div>
										<div>
											<label class="label-control">{{ ucfirst(str_replace('_', ' ', $result->student_type)) }} *</label>
											<table class="table table-bordered">
												<thead>
													<tr>
														<th>{{ ($result->student_type == 'qaidah') ? 'Page' : 'Sura' }}</th>
														<th>Start (<small>{{ ($result->student_type == 'qaidah') ? 'Box' : 'Ayat' }}</small>)</th>
														<th>End (<small>{{ ($result->student_type == 'qaidah') ? 'Box' : 'Ayat' }}</small>)</th>
														<th width="10">
															<button  type="button" class="btn btn-success"  onclick="clone_function('ajker_pora')">+</button>
														</th>
													</tr>
												</thead>

												<tbody id="ajker_pora">

													@if(count($result->sabak))
														@foreach($result->sabak as $ajker_sabak_key => $ajker_sabak_value)
															@if($ajker_sabak_value->type == 'current_sabak')
																<tr>
																	@if($result->student_type == 'qaidah')
																		<td>
																			<input type="number" min="1" step="1" required name="page_or_sura[]" value="{{ $ajker_sabak_value->page_or_sura }}" class="form-control" placeholder="Write page number">
																		</td>
																	@elseif('quran')
																		<td>
																			<input type="text" list="quran_sura" required name="page_or_sura[]" value="{{ $ajker_sabak_value->page_or_sura }}" class="form-control" placeholder="Write sura name">
																			<datalist id="quran_sura">
																				@foreach(quran_suras() as $sura)
																					<option value="{{ucfirst($sura)}}" />
																				@endforeach
																			</datalist>
																		</td>
																	@else
																		<td>
																			<input type="text" list="juz_ammah_sura" required name="page_or_sura[]" value="{{ $ajker_sabak_value->page_or_sura }}" class="form-control" placeholder="Write sura name">
																			<datalist id="juz_ammah_sura">
																				@foreach(juz_amma_suras() as $sura)
																					<option value="{{ucfirst($sura)}}" />
																				@endforeach
																			</datalist>
																		</td>
																	@endif


																	<td>
																		<input type="number" min="1" step="1" required name="from[]"  value="{{ $ajker_sabak_value->from }}" class="form-control" placeholder="Write box number">
																	</td>
																	<td>
																		<input type="number" min="1" step="1" required name="to[]"  value="{{ $ajker_sabak_value->to }}" class="form-control" placeholder="Write box number">
																	</td>
																	<td>
																		<button type="button" class="btn btn-danger" onclick="remove_tr(this)">x</button>
																	</td>
																</tr>
															@endif
														@endforeach
													@endif

												<tbody>
											</table>

											<div class="form-group">
												<label class="label-control">Memorizing *</label>
												<textarea name="memorizing" required class="form-control" rows="2" placeholder="Write...">{{ $result->memorizing }}</textarea>
											</div>
											<div class="form-group">
												<label class="label-control">Tajwid *</label>
												<textarea name="tajwid" required class="form-control" rows="2" placeholder="Write...">{{ $result->tajwid }}</textarea>
											</div>
											<div class="form-group">
												<label class="label-control">Handwriting *</label>
												<textarea name="handwriting" required class="form-control" rows="2" placeholder="Write...">{{ $result->handwriting }}</textarea>
											</div>
										</div>
									</div>
								{{-- current sabak end --}}


								{{-- homework sabak start --}}
									<div class="card card-warning p-3 mb-3">
										<div class="card-title text-danger">
											Next Homework
										</div>
										<div>
											<label class="label-control">{{ ucfirst(str_replace('_', ' ', $result->student_type)) }} <small>(Home work)</small> *</label>
											<table class="table table-bordered">
												<thead>
													<tr>
														<th>{{ ($result->student_type == 'qaidah') ? 'Page' : 'Sura' }}</th>
														<th>Start (<small>{{ ($result->student_type == 'qaidah') ? 'Box' : 'Ayat' }}</small>)</th>
														<th>End (<small>{{ ($result->student_type == 'qaidah') ? 'Box' : 'Ayat' }}</small>)</th>
														<th width="10">
															<button  type="button" class="btn btn-success"  onclick="clone_function('kalker_pora')">+</button>
														</th>
													</tr>
												</thead>

												<tbody id="kalker_pora">

													@if(count($result->sabak))
														@foreach($result->sabak as $ajker_sabak_key => $ajker_sabak_value)
															@if($ajker_sabak_value->type == 'homework')
																<tr>
																	@if($result->student_type == 'qaidah')
																		<td>
																			<input type="number" min="1" step="1" required name="home_work_page_or_sura[]" value="{{ $ajker_sabak_value->page_or_sura }}" class="form-control" placeholder="Write page number">
																		</td>
																	@elseif('quran')
																		<td>
																			<input type="text" list="quran_sura" required name="home_work_page_or_sura[]" value="{{ $ajker_sabak_value->page_or_sura }}" class="form-control" placeholder="Write sura name">
																			<datalist id="quran_sura">
																				@foreach(quran_suras() as $sura)
																					<option value="{{ucfirst($sura)}}" />
																				@endforeach
																			</datalist>
																		</td>
																	@else
																		<td>
																			<input type="text" list="juz_ammah_sura" required name="home_work_page_or_sura[]" value="{{ $ajker_sabak_value->page_or_sura }}" class="form-control" placeholder="Write sura name">
																			<datalist id="juz_ammah_sura">
																				@foreach(juz_amma_suras() as $sura)
																					<option value="{{ucfirst($sura)}}" />
																				@endforeach
																			</datalist>
																		</td>
																	@endif


																	<td>
																		<input type="number" min="1" step="1" required name="home_work_from[]"  value="{{ $ajker_sabak_value->from }}" class="form-control" placeholder="Write box number">
																	</td>
																	<td>
																		<input type="number" min="1" step="1" required name="home_work_to[]"  value="{{ $ajker_sabak_value->to }}" class="form-control" placeholder="Write box number">
																	</td>
																	<td>
																		<button type="button" class="btn btn-danger" onclick="remove_tr(this)">x</button>
																	</td>
																</tr>
															@endif
														@endforeach
													@endif

												<tbody>
											</table>

											<div class="form-group">
												<label class="label-control">Memorizing <small>(Home Work)</small> *</label>
												<textarea name="home_work_memorizing" required class="form-control" rows="2" placeholder="Write...">{{ $result->home_work_memorizing }}</textarea>
											</div>
											<div class="form-group">
												<label class="label-control">Tajwid <small>(Home Work)</small> *</label>
												<textarea name="home_work_tajwid" required class="form-control" rows="2" placeholder="Write...">{{ $result->home_work_tajwid }}</textarea>
											</div>
											<div class="form-group">
												<label class="label-control">Handwriting <small>(Home Work)</small> *</label>
												<textarea name="home_work_handwriting" required class="form-control" rows="2" placeholder="Write...">{{ $result->home_work_handwriting }}</textarea>
											</div>
										</div>
									</div>
								{{-- homework sabak end --}}


								<div class="form-group">
									<label class="label-control">Remark (<small>optional</small>)</label>
									<textarea name="remark" class="form-control" rows="5">{{ $result->remark }}</textarea>
								</div>


								<div class="form-group">
									<label class="label-control">Star achieved today (<small>optional</small>)</label>
									<div class="form-group">
										<label class="text-danger">
											<input type="radio" name="star" {{ ($result->star == 0) ? 'checked' : '' }} value="0" required> 0 star &nbsp;
										</label>
										<label class="text-primary">
											<input type="radio" name="star" {{ ($result->star == 1) ? 'checked' : '' }} value="1" required> 1 star &nbsp;
										</label>
										<label class="text-success">
											<input type="radio" name="star" {{ ($result->star == 2) ? 'checked' : '' }} value="2" required>
											2 star
										</label>
									</div>
								</div>

								<input type="submit" class="btn btn-primary" value="Update">
							</div>
						</div>
						
					</form>

				</div>
			</div>
		@else
			<div class="alert alert-warning">
				No result found
			</div>
		@endif
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
	<script>
		let student_type = "{{ $result->student_type }}";
		let student_id   = "{{ $result->student_id }}";

		window.addEventListener('load', ()=>
		{
			getStudents(student_type, student_id);
		});

		async function getStudents(studentType, student_id)
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
				let isSelected = (student_id == value.id) ? 'selected' : '';

				options += `<option ${isSelected} value="${value.id}">${value.name}</option>`;
			}

			select_student.innerHTML = options;
			my_loader.style.display  = '';
		}
	</script>


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
	</script>

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
							_length            = lastChild_children.length-1,
							i                  = 0;

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