require_relative './model/board'
require_relative './model/game'
require_relative './model/player'
require_relative './model/ship'

def create_game
  ships1 = make_ships
  ships2 = make_ships
  players = [:no_player,:no_player]
  game = Game.new(players: players, ships:[ships1,ships2])
  return game
end

def create_player
  board = Board.new
  name = params[:name] if params[:name]
  player = Player.new(name:name, board:board)
end

def make_ships
  ship_hash = {
    aircraft_carrier: Ship.aircraft_carrier,
    battleship: Ship.battleship,
    submarine: Ship.submarine,
    destroyer: Ship.destroyer,
    patrol_boat: Ship.patrol_boat}
  ship_hash
end
