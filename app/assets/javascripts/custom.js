document.addEventListener('turbolinks:load', function() {
  jQuery('.owl-carousel').owlCarousel({
    loop: true,
    margin: 10,
    nav: true,
    responsive: {
      0: {
        items: 1
      },
      600: {
        items: 3
      },
      1000: {
        items: 5
      }
    }
  });
  $(window).scroll(function(){
    if ($(this).scrollTop() > 400) {
      $('.navigation1').fadeIn();
    }
    else {
      $('.navigation1').fadeOut();
    }
  });
  var open = false;
  $('#footerSlideButton').click(function () {
    if(open === false) {
      $('#footerSlideContent').animate({height: '270px'});
      $(this).css('backgroundPosition', 'bottom left');
      open = true;
    } else {
      $('#footerSlideContent').animate({height: '0px'});
      $(this).css('backgroundPosition', 'top left');
      open = false;
    }
  });
});
document.addEventListener('turbolinks:load', function() {
  $(document).on('change', '.radio', function() {
    $(this).closest('form').submit();
  });
  $(document).ready(function(){
    $('.edit-form').hide();
  });
});
$(document).on('click', '.edit-comment', function(){
  $(this).closest('div').parent().find('.edit-form').fadeIn();
});
