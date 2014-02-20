

  function format(json){
    formatedObj = {}
    _.each($.parseJSON(json),function(item){
      formatedObj[item["id"]] = item;
    } )
    return formatedObj
  }

