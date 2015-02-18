class Player

  attr_reader :homeboard

  def initialize(homeboard: "No Board")
    @homeboard = homeboard
  end

  def rotate(ship)
    ship.change_orientation
  end

  def place(ship, origin)
    @homeboard.place(ship, origin)
  end



end
