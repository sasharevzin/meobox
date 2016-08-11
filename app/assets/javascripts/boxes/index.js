$(document).ready(function() {
  $('#ajax-boxes').click(function(e) {
    e.preventDefault();

    $.ajax({
      url:  '/api/v1/boxes',
      dataType: 'json'
    }).done(function(data) {
      var data_to_html = "";
      for (var i = 0; i < data.length; i++) {
        var s = new Box(data[i]);
        data_to_html += s.boxDisplay();
      }

      $("#all-boxes").append(data_to_html);
    });

  });
});

function Box(box){
  this.plan_name = box['plan_name'];  
  this.title = box['title'];
  this.theme_title = box['theme_title'];
  this.shipped = box['shipped'];
  this.items = box['items'];
}

//Box Prototypes
Box.prototype.itemsDisplay = function(box) {
  data_to_html = "";

  box.items.forEach(function(item) {
    itemObject = new Item(item)
    data_to_html += itemObject.itemDisplay();
  })

  return data_to_html;
}


Box.prototype.boxDisplay = function(){
  var my_html = "" 
  my_html += '<div class="col-md-3">';
  my_html += '  <div class="thumbnail">';
  my_html += '    <img src=""></img>';
  my_html += '    <div class="caption">';
  my_html += '      <h3>'+ 'Subscription: ' + this.plan_name + '</h3>';
  my_html += '      <p>' + 'Theme Title: ' +  this.theme_title+ '</p>';
  my_html += '      <p>' + 'Shipped: ' +  this.shipped + '</p>';
  my_html += '      <h3> Items for </h3>' + this.theme_title;
  my_html +=        this.itemsDisplay(this);
  my_html += '    </div>';
  my_html += '  </div>';
  my_html += '</div>';

  return my_html;
};