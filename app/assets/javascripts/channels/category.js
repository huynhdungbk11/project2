$(document).ready(function() {
  $('#create_cate_button').on('click',function(e) {
    e.preventDefault();
    name = $('#category_name_form').val();
    description = $('#category_description_form').val();
    console.log(name + ' ' + description);
    $.ajax({
      type: "POST",
      url: "/admin/categories",
      dataType: "json",
       data: {
          category: {
            name: name,
            description: description
          }
        },
      success: function(data) {
        if (data.category != null) {
          display = "<tr class='odd gradeX'>" +
            "<td>"+data.category.id+"</td>"+
            "<td>"+data.category.name+"</td>"+
            "<td>"+data.category.description+"</td>"+
            "<td>0</td>"+
            "<td class='button_inline'><a class='button_view button'"+
            "href=categories/"+data.category.id+">View</a>"+
            " <a class='button_delete button'"+
            "href=categories/"+data.category.id+" data-method='delete'>"+
            "Delete</a></td>"+
            "</tr>"
          $('#category_body').prepend(display);
          $('#category_name_form').val('')
          $('#category_description_form').val('')
          $('#mess-area-add').html('');
        } else {
          display = "<h1>Can't create</h1>"
          $('#mess-area-add').html(display);
        }
      },
      error: function(error_message) {
          alert('Error');
        }
    });
  });
});
