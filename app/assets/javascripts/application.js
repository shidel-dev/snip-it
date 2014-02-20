

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
    $('body').css('overflow', 'hidden');
    var cardData = $(e.target).data('snips') || $(e.target).parent().data('snips');

    _.templateSettings.variable = "v";
    var template = _.template($("script.template").html());

    $('.content').html(template(cardData));
  });

  $('.mask').on('click', function(e) {
    $('.modelHolder').css('display', 'none');
    $('body').css('overflow', 'visible');
  });


});

