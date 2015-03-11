class Player

  attr_reader :name, :board

  def initialize(name: "Player1", board: "No Board")
    @board = board
    @name = name
  end

  def rotate(ship)
    ship.change_orientation
  end

  def place(ship, origin)
    @board.place(ship, origin)
  end



end
