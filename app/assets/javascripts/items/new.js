$(document).ready(function(){
  $('form#new_item').submit(function(event) {
    // Hijack form default behavior
    event.preventDefault();
    var item_params = $(this).serialize();
    var item = $.post('/api/v1/items', item_params);
    item.done(function(data) {
      console.log(data);
      var item = data["item"];
      console.log('item: ' + item);
      var item = new Item(item);
      var modifiedTitle = item.modifiedTitle();
      var modifiedPrice = item.modifiedPrice();

      $("#itemTitle").text(item["title"]);
      $("#itemDescription").text(item["description"]);
      $("#itemPrice").text(item["price"]);
      $("#itemModifiedPrice").text(modifiedPrice);
      $("#itemImage").text(item["image"]);
      $("#itemSize").text(item["size"]);
      $("#itemUrl").text(item["url"]);
      $("#itemModifiedTitle").text(modifiedTitle);
      $("form#new_item").hide();
    });
  });    
});

function Item(item){
  this.title = item['title'];  
  this.description = item['description'];
  this.price = item['price'];
  this.image = item['image'];
  this.size = item['size'];
  this.url = item['url'];
}

//Item Prototypes
Item.prototype.itemDisplay = function(){
  var my_html = "" 
  my_html += '<div class="col-md-3">';
  my_html += '  <div class="thumbnail">';
  my_html += '    <img src=""></img>';
  my_html += '    <div class="caption">';
  my_html += '      <h3>'+ this.title + '</h3>';
  my_html += '      <p>' + this.description + '</p>';
  my_html += '      <p>' + this.formatted_price + '</p>';
  my_html += '      <p>' + this.size + 'lbs</p>';
  my_html += '      <p>' + this.url + '</p>';
  my_html += '    </div>';
  my_html += '  </div>';
  my_html += '</div>';

  return my_html;
};

Item.prototype.modifiedTitle = function(){
  return ("my new modified title: " + this.title);
}

Item.prototype.modifiedPrice = function(){
  return (this.price + "$");
}
