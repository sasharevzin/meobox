$(function () {
  $('#items').submit(function(event) {
    //prevent form from submitting the default way
    event.preventDefault();

    var item_params = $(this).serialize();

    var item = $.post('/api/v1/items', item_params);

    item.done(function(data) {
      // alert("item: " + data["id"] + "was successfully created!");
      // TODO: handle response
      console.log(data);
      var item = data["item"];
      $("#itemTitle").text(item["title"]);
      $("#itemDescription").text(item["description"]);
      $("#itemPrice").text(item["price"]);
      $("#itemImage").text(item["image"]);
      $("#itemSize").text(item["size"]);
      $("#itemUrl").text(item["url"]);
      $("#items").hide();
    });
  });
});

