$(document).ready(function() {

  var ships_array = [];
  var grid = document.getElementsByClassName('cell');
  var ship_locations = new Object();

  % ships.each_value do |ship|
    var ship = {
      name: '{{ship.name}}',
      size: {{ship.size}},
      id: '{{ships.key(ship)}}'
    }
    ships_array.push(ship);
  % end

  var current_ship = ships_array.shift();

  $('#ship_name').text(current_ship.name);


  //..Phantom Ship Display

  $('.sea').on('mouseover', function() {
    show_ship(this, current_ship.size);
  });
  $('.sea').on('mouseout', function() {
    show_ship(this, current_ship.size);
  });

  //..Placing a ship

  $('.sea').on('click', function() {
    place_ship(this, current_ship.size);
    current_ship = ships_array.shift();
    $('#ship_name').text(current_ship.name);
  });


  // Functions

  // I feel like now that I've added grid ID's to each cell,
  // I no longer have to iterate over the grid..

  var show_ship = function(cell, ship_size) {
    for (var i=0;i<grid.length;i++) {
      if (cell === grid[i]) {
        for (var j=0;j<ship_size;j++) {
          $(grid[i-j*10]).toggleClass('sea');
          $(grid[i-j*10]).toggleClass('boat');
        }
      }
    }
  }; // end show_ship

  var place_ship = function(cell, ship_size) {
    //show_ship(cell, ship_size);
    for (var i=0;i<grid.length;i++) {
      if (cell === grid[i]) {
        for (var j=0;j<ship_size;j++) {
          $(grid[i-j*10]).toggleClass('permaboat');
          $(grid[i-j*10]).toggleClass('boat');
        }
      }
    }
  }; // end place_ship


}); // end document ready

  var grid_clean = function() {
    console.log('Grid cleaned!');
    var grid = document.getElementsByClassName('cell');
    for (var i=0;i<grid.lenth;i++) {
      if (grid[i].hasClass('boat')) {
        $(grid[i].toggleClass('sea'));
        $(grid[i].toggleClass('boat'));
      }
    }
  };


