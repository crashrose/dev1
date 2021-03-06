$(document).ready(function() {

    // Popover script
    $("a[rel=popover]").popover()
    $(".tooltip").tooltip()
    $("a[rel=tooltip]").tooltip()

    // select2 tags
    $('.tagselect').each(function() {
        var placeholder = $(this).data('placeholder');
        var url = $(this).data('url');
        var saved = $(this).data('saved');
        $(this).select2({
            tags: true,
            placeholder: placeholder,
            minimumInputLength: 1,
            initSelection : function(element, callback){
                saved && callback(saved);
            },
            ajax: {
                url: url,
                dataType: 'json',
                data:    function(term) { return { q: term }; },
                results: function(data) { return { results: data }; }
            },
            createSearchChoice: function(term, data) {
                if ($(data).filter(function() {
                    return this.name.localeCompare(term)===0;
                }).length===0) {
                    return { id: term, name: term };
                }
            },
            formatResult:    function(item, page){ return item.name; },
            formatSelection: function(item, page){ return item.name; }
        });
    });

    //Radial Progress Bar

    $('.radial-progress').each(function() {
        var $this = $(this);
        var $circle_text = '<div class="circle"><div class="mask full"><div class="fill"></div></div><div class="mask half"><div class="fill"></div><div class="fill fix"></div></div></div>';
        var $border_text = '<div class="circle-border"></div>';
        var $pct_text = '<div class="percentage"><span>' + $this.data('progress') + '</span></div>';
        $this.append($circle_text);
        if($this.data('showborder') == true ) {$this.append($border_text);}
        if($this.data('showpct') == true ) {$this.append($pct_text);}
        if($this.data('progress') <= 25) {$this.addClass("circle-red");}
        else if($this.data('progress') < 100) {$this.addClass("circle-yellow");}
        else {$this.addClass("circle-green");}
    });

    $('.progress-bar').each(function() {
        var $this = $(this);
        if($this.attr('aria-valuenow') <= 25) {$this.addClass("progress-red");}
        else if($this.attr('aria-valuenow') < 100) {$this.addClass("progress-yellow");}
        else {$this.addClass("progress-green");}
    });

    if ($("[id$=_group_ids]").hasClass('group-list')) {
        $("[id$=_group_ids]").change(function() {
            var url = (document.URL.split($(this)[0].form.attributes['action'].value)[0] 
                + '/admin/access_list?orig=' 
                + $(this).data('groups')
                + '&new=' 
                + $(this).val() || []
                );
            $.getJSON(url , function(data) {
                var tbl_body = "<tr><th>Status</th><th>Person</th><th>Group(s) Granting Access</th></tr>";
                if (!data) {
                    tbl_body = "<tr><td colspan='3'>No Groups Currenty Selected</td><tr>"
                }
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
    }

    // Allowing new file selection
    $('.select-file-btn').click(function() {
        var upload_input = $('[id$=_document_file_name]')[0];
        console.log(upload_input);
        document.getElementById('select-file-btn').style.display="none";
        upload_input.setAttribute('type','file');
    })


    // Resetting the Form
    $('.reset-btn').click(function() {
        var form = document.forms[0];
        if ($('[id$=_document_file_name]')[0]) {
            var upload_input = $('[id$=_document_file_name]')[0];
            document.getElementById('select-file-btn').style.display="block";
            upload_input.setAttribute('type','text');
        }
        form.reset();
        if ($('[id$=_tag_list]')) {$('[id$=_tag_list]').change();}
        if ($('[id$=_group_ids]')) {$('[id$=_group_ids]').change();}
        // if ($('[id$=_group_ids] .duallist-in')) {$('[id$=_group_ids]').reset();$('[id$=_group_ids]').change();}
    })


    $('.right-move-btn').click(function() {
        var options = $("[id$=_ids].duallist-out option:selected");
        $('[id$=_ids].duallist-in').append(options);
    })

    $('.left-move-btn').click(function() {
        var options = $("[id$=_ids].duallist-in option:selected");
        $('[id$=_ids].duallist-out').append(options);
    })

    $('.right-mov-btn').click(function() {
        var box_name = this.attributes['parent_box'].value;
        // console.log($("[id$="+box_name+"]"));
        var options = $("[id$="+box_name+"].duallist-out option:selected");
        $("[id$="+box_name+"].duallist-in").append(options);
    })

    $('.left-mov-btn').click(function() {
        var box_name = this.attributes['parent_box'].value;
        var options = $("[id$="+box_name+"].duallist-in option:selected");
        $("[id$="+box_name+"].duallist-out").append(options);
        console.log($("[id$="+box_name+"].duallist-in"));
    })

    $(document.forms).submit(function( event ) {
        // event.preventDefault();
        $("select.duallist-in", this).each(function() {
            $("option", this).prop('selected', true);
        });

    })

});