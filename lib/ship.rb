class Ship

  attr_reader :size, :hits, :name, :orientation

  def initialize(size = 1, name = 'dinghy')
    @size = size
    @hits = 0
    @placed = false
    @orientation = :vertical
    @name = name
  end

  def hit
    @hits += 1
  end

  def sunk?
    @hits >= @size
  end

  def place
    @placed = true
  end

  def placed?
    @placed
  end

  def portrait?
    @portrait_orientation
  end

  def change_orientation
    @orientation == :vertical ? @orientation = :horizontal : @orientation = :vertical if !placed?
  end

  # Class Methods

  def Ship.aircraft_carrier
    new 5, 'Aircraft Carrier'
  end

  def Ship.battleship
    new 4, 'Battleship'
  end

  def Ship.submarine
    new 3, 'Submarine'
  end

  def Ship.destroyer
    new 3, 'Destroyer'
  end

  def Ship.patrol_boat
    new 2, 'Patrol Boat'
  end




end
