$(document).ready(function() {
  $('#show_item_details').click(function(){
    event.preventDefault();
    var item_id = $(this).data('id');
      $.ajax({
        url: '/api/v1/items/' + item_id,
        dataType: 'json'
      }).done(function(data) {
        // data is the JSON response from the server
        // var response = JSON.parse(data);
        $('#myModal').modal('show');
        // whatever to display data as a table
        $("#title").html(data['title']);
        $("#description").html(data['description']);
        $("#price").html(data['price']);
        $("#size").html(data['size']);
        $("#url").html(data['url']);
      });
  });
}

  



