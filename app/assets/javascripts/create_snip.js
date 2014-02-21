var editor = ace.edit("editor");
editor.setTheme("ace/theme/solarized_light");
editor.getSession().setMode("ace/mode/javascript");

$(document).ready(function() {
  // var content = $("#content")
  // content.on("keyup",function(){
  //   content.val(editor.getSession().getValue());
  // })
  $('#new_snip_form').on('submit', function(e) {
    e.preventDefault();
    var content = $("#snip_content")
    content.val(editor.getSession().getValue());
    var data = $(this).serialize();
    $.post('/snips', data, function() {
      console.log('yea!');
    })
  })

  $('#snip_language_id').change(function() {
    editor.getSession().setMode("ace/mode/"+ $('#snip_language_id :selected').data("code"))
  })
});
