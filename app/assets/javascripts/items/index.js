$(document).ready(function(){
  $('.show_details').click(function(){
  event.preventDefault();
  var item_id = $(this).data('id');
    $.ajax({
      url: '/api/v1/items/' + item_id,
      dataType: 'json'
    }).done(function(data) {
      $("#title").html(data['title']);
      $("#description").html(data['description']);
      $("#price").html(data['price']);
      $("#size").html(data['size']);
      $("#url").html(data['url']);

      $('#myItem').modal('show');
    });
  });

    $('#ajax-search').submit(function(){
      event.preventDefault();
      var search = $('#ajax_search').val();
      $.ajax({
        url:  '/api/v1/items?search=' + search,
        dataType: 'json'
      }).done(function(data) {
        console.log("started here");
        var data_to_html = "";
        for (var i = 0; i < data.length; i++) {
          var s = new Item(data[i]);
          console.log("ending here");
          data_to_html += s.itemDisplay(); 
        }
        $('#data_list').html(data_to_html);
      });
  });
});
