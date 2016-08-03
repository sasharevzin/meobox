$(function () {
  $('form').submit(function(event) {
    //prevent form from submitting the default way
    event.preventDefault();

    var item_params = $(this).serialize();

    var item = $.post('/items', item_params);

    item.done(function(data) {
      // alert("item: " + data["id"] + "was successfully created!");
      // TODO: handle response
      console.log(data);
      var item = data["item"];
      $("#itemTitle").text(item["title"]);
      $("#itemBody").text(item["description"]);
      $("form").hide();
    });
  });
});