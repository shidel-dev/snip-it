var editor = ace.edit("editor");
editor.setTheme("ace/theme/textmate");
editor.getSession().setMode("ace/mode/javascript");
editor.renderer.setShowGutter(false); 
// editor.setOption("showInvisibles", true);
editor.setOption("showPrintMargin", false)

$(document).ready(function() {
  // var content = $("#content")
  // content.on("keyup",function(){
  //   content.val(editor.getSession().getValue());
  // })
  $('#editor').focus(function(){
    console.log("focus");
  })
  $('#new_snip_form').on('submit', function(e) {
    e.preventDefault();
    var content = $("#snip_content")
    content.val(editor.getSession().getValue());
    var data = $(this).serialize();
    $.post('/snips', data);
  })

  $('#snip_language_id').change(function() {
    editor.getSession().setMode("ace/mode/"+ $('#snip_language_id :selected').data("code"))
  })
});
