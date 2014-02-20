

  function format(json){
    formatedObj = {}
    _.each($.parseJSON(json),function(item){
      formatedObj[item["id"]] = item;
    } )
    return formatedObj
  }

$(document).ready(function() {
  $('.cards_data').on('click', function(e) {
    $('.modelHolder').css('display', 'block');
    var cardData = $(e.target).data('snips') || $(e.target).parent().data('snips');
  });

  $('.mask').on('click', function(e) {
    $('.modelHolder').css('display', 'none');
  });
});

