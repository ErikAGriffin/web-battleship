class Player

  attr_reader :name, :homeboard

  def initialize(name: "Player1", homeboard: "No Board")
    @homeboard = homeboard
    @name = name
  end

  def rotate(ship)
    ship.change_orientation
  end

  def place(ship, origin)
    @homeboard.place(ship, origin)
  end



end
