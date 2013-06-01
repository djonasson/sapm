$(document).ready(function() {

  $('.resource-filter button').click(function() {
    $('.resource-filter button').removeClass('active');
    $(this).addClass('active');
    $('.scenarios').hide();
    $('.features').hide();
    if ($(this).attr('name') == 'everything') {
      $('.scenarios').show();
      $('.features').show();
    } else {
      $("." + $(this).attr('name')).show();
    }
  });

  $('.content-filter button').click(function() {
    $('.content-filter button').removeClass('active');
    $(this).addClass('active');

    switch($(this).attr('name')) {
    case 'all':
      $('.feature > .body > .description').show();
      $('.feature > .body > .background').show();
      $('.scenario > .body > .description').show();
      break;
    case 'description':
      $('.feature > .body > .description').show();
      $('.feature > .body > .background').hide();
      $('.scenario > .body > .description').show();
      break;
    default:
      $('.feature > .body > .description').hide();
      $('.feature > .body > .background').hide();
      $('.scenario > .body > .description').hide();
    }
  });

});
