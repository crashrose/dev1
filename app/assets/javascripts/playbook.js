
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
    $('#upload_tag_list').change();
    $('#upload_group_ids').change();
  })

  $('.clear-btn').click(function() {
    var sel_options = document.getElementById('upload_group_ids').selectedOptions
    console.log(sel_options);
    var values = [];

  })


  $( "#upload_group_ids" )

  .change(function() {
      var id = $( "#id_val" ).data('id');
      var form = $(document.forms[0]);
      var action = document.forms[0].attributes['action'].value;
      var url = document.URL;
      url = url.split(action)[0] + '/admin/access_list';
      var group_array = $( "#upload_group_ids" ).val() || [];
      var url = url + '?p=' + id + '&g=' + group_array
      console.log(url);
      $.getJSON(url , function(data) {
        var tbl_body = "<tr><th>Status</th><th>Person</th><th>Group(s) Granting Access</th></tr>";
        if (!data) {tbl_body = "<tr><td colspan='3'>No Groups Currenty Selected</td><tr>"}
          else {
        $.each(data, function() {
          var tr_class = '';
          switch (this['status']) 
          {
          case "Removed":
            tr_class = " danger ";
            break;
          case "Added":
            tr_class = " success ";
            break;
          case "Saved":
            tr_class = " ";
            break;
          case "Unchanged":
            tr_class = " ";
            break;
          default:
            tr_class = " ";
          break;
          }

            var tbl_row = "";
            $.each(this, function(k , v) {
                tbl_row += '<td>'+v+"</td>";
            })
            tbl_body += '<tr class="' + tr_class +'">'+tbl_row+"</tr>";
        })
      }
        $("#access_list_table tbody").html(tbl_body);
      });
  })
  .trigger( "change" );



})