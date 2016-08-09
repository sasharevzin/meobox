$(document).ready(function(){
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

    function row_html(data) {
      var my_html = "" 
      
      my_html += '<div class="col-md-3">';
      my_html += '  <div class="thumbnail">';
      my_html += '    <img src=""></img>';
      my_html += '    <div class="caption">';
      my_html += '      <h3>' + data.title + '</h3>';
      my_html += '      <p>' + data.description + '</p>';
      my_html += '      <p>' + data.formatted_price + '</p>';
      my_html += '      <p>' + data.size + 'lbs</p>';
      my_html += '      <p>' + data.url + '</p>';
      my_html += '    </div>';
      my_html += '  </div>';
      my_html += '</div>';

      return my_html;
    }

    $('#search_button').click(function(){
      event.preventDefault();
      var search = $('#ajax_search').val();
    $.ajax({
      url:  '/api/v1/items?search=' + search,
      dataType: 'json'
    }).done(function(data) {
      var data_to_html = "";
      for (var i = 0; i < data.length; i++) {
        data_to_html += row_html(data[i]);
      }
      $('#data_list').html(data_to_html);
    });
  });
});
