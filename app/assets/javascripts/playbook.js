
jQuery(document).ready(function($) {

  $('.select-file-btn').click(function() {
    var upload_input = document.getElementById('upload_document_file_name');
    document.getElementById('select-file-btn').style.display="none";
    upload_input.setAttribute('type','file');
  })

  $('.reset-btn').click(function() {
    var form = document.forms[0];
    var upload_input = document.getElementById('upload_document_file_name');
    document.getElementById('select-file-btn').style.display="block";
    upload_input.setAttribute('type','text');
    form.reset();
  })

})