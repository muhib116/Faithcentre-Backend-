function cl(x){
    return document.getElementsByClassName(x);
}
/* image upload script start */
var file_upload_input  = document.getElementsByClassName('file-upload-input'),
    file_upload_inputL = file_upload_input.length,
    i                  = 0;

for(i; i<file_upload_inputL; i++){
    file_upload_input[i].setAttribute('onchange', "set_for_upload("+i+",this)");
    cl('remove-image')[i].setAttribute('onclick', "removeUpload("+i+")");
    cl('file-upload-btn')[i].setAttribute('onclick', "file_upload_btn("+i+")");
}

// this event for file upload btn
function file_upload_btn(index){
    file_upload_input[index].click();
}

function set_for_upload(index,e){
    var file                                       = URL.createObjectURL(e.files[0]);
    cl('file-upload-image')[index].src             = file;
    cl('image-upload-wrap')[index].style.display   = 'none';
    cl('file-upload-content')[index].style.display = 'block';
}

function removeUpload(index) {
    cl('file-upload-input')[index].value           = null;
    cl('file-upload-content')[index].style.display = "none";
    cl('image-upload-wrap')[index].style.display   = 'block';
}
