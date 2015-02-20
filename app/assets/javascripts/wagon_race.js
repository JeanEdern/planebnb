
$(document).ready(function() {
  var playing = true;

  $('.btn-danger').on('click', function(event) {
      $('.winner').removeClass('winner').addClass('final');
      $('.final').text("Arrivée");
      $('.active').removeClass('active');
      $('tr td:first-child').addClass('active');
      playing = true;
  });

  $(document).on('keyup', function(event) {
    if (playing == true) {
    // Detect which key was pressed and call the appropriate function
    // Google "jquery keyup what key was pressed" if you don't know how
      if(event.which == 81) { $('#player1_race > .active').removeClass('active').next().addClass('active') };
      if(event.which == 80) { $('#player2_race > .active').removeClass('active').next().addClass('active') };

      var $index_player1 = $('#player1_race > .active').index();
      var $index_player2 = $('#player2_race > .active').index();

      if($index_player2 == 26) {
        $('#player2_race > .active').removeClass('active').removeClass('final').addClass('winner').text("winner");
        playing = false;
      };

      if($index_player1 == 26) {
        $('#player1_race > .active').removeClass('active').removeClass('final').addClass('winner').text("winner");
        playing = false;
      };
    };
  });
});