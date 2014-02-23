function format(json){
  formatedObj = {}
  _.each($.parseJSON(json),function(item){
    formatedObj[item["id"]] = item;
  } )
  return formatedObj
}

$(document).ready(function() {

  $('.cards_data').on('click', function(e) {
    $('.modalHolder').css('display', 'block');

    $('body').css('overflow', 'hidden');
    var cardData = $(e.target).data('snips') || $(e.target).parent().data('snips');

    _.templateSettings.variable = "v";
    var template = _.template($("script.template").html());

    $('.content').html(template(cardData));
    $("#results_editor").text(cardData.content);
    var editor = ace.edit("results_editor");
    editor.setTheme("ace/theme/textmate");
    editor.getSession().setMode("ace/mode/ruby");
    editor.renderer.setShowGutter(false); 
    editor.setOption("showPrintMargin", false);
    editor.setOptions({maxLines: 16});
    editor.renderer.$cursorLayer.element.style.opacity=0;
    editor.setReadOnly(true);
    $('.content').css('margin-left', '-' + (($('#results_editor').width()) / 2) + 'px' );
    $('.content').css('margin-top', '-' + (($('#results_editor').height()) / 2) + 'px' );
  });

  $('.mask').on('click', function(e) {
    $('.modalHolder').css('display', 'none');
    $('body').css('overflow', 'visible');
  });

});

$(document).on('page:load', function() {
    console.log("here");
  $('#add_to_board_button').on('click',function(){
    $("#add_to_board_modal").show();
  });
});
