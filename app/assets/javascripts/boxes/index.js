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
  this.subscription = box['subscription'];  
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
  my_html += '      <h3>'+ this.subscription + '</h3>';
  my_html += '      <p>' + this.title + '</p>';
  my_html += '      <p>' + this.theme_title+ '</p>';
  my_html += '      <p>' + this.shipped + 'lbs</p>';
  my_html += '      <h3> Items </h3>';
  my_html +=        this.itemsDisplay(this);
  my_html += '    </div>';
  my_html += '  </div>';
  my_html += '</div>';

  return my_html;
};