var ready;
ready = function() {
  $('.show_details').click(function(){
    event.preventDefault();
    var item_id = $(this).data('id');
      $.ajax({
        url: '/api/v1/items/' + item_id,
        dataType: 'json'
      }).done(function(data) {
        $('#myItem').modal('show');
        $("#title").html(data['title']);
        $("#description").html(data['description']);
        $("#price").html(data['price']);
        $("#size").html(data['size']);
        $("#url").html(data['url']);
      });
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);