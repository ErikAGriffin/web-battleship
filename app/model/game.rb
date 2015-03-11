class Game

  attr_reader :player1, :player2, :active_player

  def initialize(players: [:no_player,:no_player], ships: [:"{no_ships}",:"{no_ships}"])
    @player1 = players.first
    @player2 = players.last
    @p1ships = ships.first
    @p2ships = ships.last
    @active_player = player1
  end

  # Unsure if the game class needs ships at all, or if they can just be
  # created by the server.
  # Unsure if other classes need this access, will delete if not
  def p1ships
    @p1ships
  end

  def p2ships
    @p2ships
  end

  def add_player(player)
    raise "Game is full!" if full?
    player1 == :no_player ? @player1 = player : @player2 = player
  end

  def full?
    player2 != :no_player
  end

  def shoot(origin)
    shot = opponent.board.shoot(origin)
    if game_over?
      return declare_winner
    else
    handle(shot)
    end
  end

  # # # # # # # # # # # # # #

  private

  def switch_active_player
    @active_player = opponent
  end

  def opponent
    @active_player == @player1 ? @player2 : @player1
  end

  def opponent_ships
    @active_player == @player1 ? @p2ships : @p1ships
  end

  def game_over?
    opponent_ships.values.all? &:sunk?
  end

  def declare_winner
    "DIRECT HIT!! Cap'n you've done it!! The enemy is defeated"
  end

  def handle(shot)
    case shot
      when :HIT
        "DIRECT HIT!! Well done sir!"
      when :MISS
        "Cap'n! We missed!!"
      when :DUPL
        "Blast we wasted that shot. You've already fired on that location!"
    else
      "Something has gone, terribly, terribly wrong"
    end
  end

end
