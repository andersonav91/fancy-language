
function get_plugin_languages(select, url){
    $.ajax({
        url: url,
        type: 'get',
        data: {plugin: $(select).val()},
        success: function(data){ $(select).html(data); }
    });
}