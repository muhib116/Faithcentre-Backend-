
<div>
  <div class="tab_btn_container">
    <span class="rider"><span class="after" style="opacity: 1;"></span></span>
    <a data-item="0" class="active">Teachers</a>
    <a data-item="1">Students</a>
  </div>


  <div class="tab_content_container">
    
    {{-- teachers start --}} 
    <div class="tab_content active table-responsive">
      @if(count($teachers))
        <input type="search" oninput="filter_table(this, 'teacher_table_filter')" class="form-control" placeholder="Filter Teachers...">
        <table class="table table-bordered">
          <thead>
            <tr>
              <th width="10">sl</th>
              <th>Name</th>
              <th>Type</th>
              <th width="10">Action</th>
            </tr>
          </thead>

          <tbody id="teacher_table_filter">
            @foreach($teachers as $key => $value)
              <tr>
                <td>{{ ++$key }}</td>
                <td>{{ ucwords($value->name) }}</td>
                <td>{{ $value->email }}</td>
                <td>
                  <a href="{{ route("admin.single_overview", ['teacher', $value->id]) }}?system=MTA5XzE4MA==" class="btn btn-info" title="View Chart" aria-label="View Chart">
                    <i class="fa fa-bar-chart"></i>
                  </a>
                </td>
              </tr>
            @endforeach
          </tbody>
        </table>
      @else
        <div class="alert alert-warning">
          Teachers Not Found
        </div>
      @endif
    </div>
    {{-- teachers end --}} 
    
    
    {{-- students start --}} 
    <div class="tab_content">
      @if(count($students))
        <input type="search" oninput="filter_table(this, 'students_table_filter')" class="form-control" placeholder="Filter Students...">
        <table class="table table-bordered">
          <thead>
            <tr>
              <th width="10">sl</th>
              <th>Name</th>
              <th>Type</th>
              <th width="10">Action</th>
            </tr>
          </thead>

          <tbody id="students_table_filter">
            @foreach($students as $key => $value)
              <tr>
                <td>{{ ++$key }}</td>
                <td>{{ $value->name }}</td>
                <td>{{ ucwords($value->type) }}</td>
                <td>
                  <a href="{{ route("admin.single_overview", ['student', $value->id]) }}?system=MTA5XzE4MA==" class="btn btn-info" title="View Chart" aria-label="View Chart">
                    <i class="fa fa-bar-chart"></i>
                  </a>
                </td>
              </tr>
            @endforeach
          </tbody>
        </table>
      @else
        <div class="alert alert-warning">
          Students Not Found
        </div>
      @endif
    </div>
    {{-- students end --}}
  </div>

</div>




@push('css')
  <style>
    .tab_btn_container {
      display: flex;
      font-family: arial;
      position: relative;
      border: 1px solid #0000001c;
        margin-top: -1px;
    }
    .tab_btn_container .rider {
       position: absolute;
       left: 0;
       top: 0;
       height: 100%;
       background-color: #2196f3;
       transition: 0.4s cubic-bezier(0.66, 0.96, 0.73, 1.23);
    }
    .tab_btn_container .rider span.after {
       position: absolute;
       width: 0;
       height: 0;
       border-right: 15px solid transparent;
       border-top: 13px solid #2196f3;
       top: 100%;
       left: 50%;
       transform: translateX(-50%);
       opacity: 0;
       display: inline-block;
       z-index: 1;
    }
    .tab_btn_container a {
       position: relative;
       text-decoration: none;
       color: #333;
       display: block;
       font-size: 16px;
       padding: 10px 25px;
       transition: 0.4s ease-in-out;
       cursor: pointer;
       border: none;
       outline: none;
       cursor: pointer;
    }
   .tab_btn_container a + a {
       border-left: 1px solid #000 1;
    }
    .tab_btn_container a.active {
       color: #fff;
    }
    .tab_content_container {
       display: flex;
       width: 100%;
       overflow-x: hidden;
       border: 1px solid #ccc;
       box-shadow: 0 4px 6px #444 2;
    }
    .tab_content_container .tab_content {
       display: none;
       min-width: 100%;
       padding: 15px;
    }
    .tab_content_container .tab_content.active {
       display: block;
    }
  </style>
@endpush



@push('js')

  <script>
    /* html table filter javaScript code start */
    function filter_table(This, table_id)
    {
        let recordLists = document.querySelectorAll(`#${table_id}>*`);
        if(recordLists)
        {
            hide_tr(recordLists);
            recordLists.forEach(recordList=>{
                let str   = recordList.innerText.toLowerCase(),
                    value = This.value.toLowerCase();

                if(str.indexOf(value)>=0)
                {
                    recordList.style.display = '';
                }
            });
        }
    }


    function hide_tr(recordLists) {
        recordLists.forEach(recordList=>{
            recordList.style.display = 'none';
        });
    }
    /* html table filter javaScript code end */
  </script>



  {{-- tab script start --}}
  <script>
    let tab_btn_container_rider  = document.querySelector('.tab_btn_container .rider'),
      tab_btn_container_a        = document.querySelectorAll('.tab_btn_container a'),
      tab_btn_container_a_active = document.querySelector('.tab_btn_container a.active'),
      tab_content                = document.querySelectorAll('.tab_content_container .tab_content');

    window.addEventListener('DOMContentLoaded', ()=>{
      tab_btn_container_rider.style.left = tab_btn_container_a_active.offsetLeft+'px';
      tab_btn_container_rider.style.width = tab_btn_container_a_active.offsetWidth+'px'
    });


    if(tab_btn_container_a && tab_btn_container_rider)
    {
      tab_btn_container_a = Array.isArray(tab_btn_container_a) ? tab_btn_container_a : Object.values(tab_btn_container_a);
      
      tab_btn_container_a.forEach(a=>{
        a.addEventListener('click', function(){
          
          tab_btn_container_a.forEach((_a, index)=>{
            _a.classList.remove('active');
            
            if(tab_content[index])
            {
              tab_content[index].classList.remove('active');
            }
          });
          
          
          
          // console.log(this.getBoundingClientRect());
          this.classList.add('active');
          

          if(tab_content[this.dataset.item])
          {
            tab_content[this.dataset.item].classList.add('active');
          }
          
          tab_btn_container_rider.style.left = this.offsetLeft+'px';
          tab_btn_container_rider.style.width = this.offsetWidth+'px'
        });
      });
    }
  </script>
  {{-- tab script end --}}
@endpush