require 'hobbit'
require 'hobbit/contrib'
require 'data_mapper'
require_relative 'custom-hobbit'
require_relative 'data_mapper_setup'

require_relative 'game_setup'


class Server < Hobbit::Base
  include Hobbit::Mote
  include Hobbit::Session


  running_games = []

  get '/' do
    render 'index'
  end

  get '/new-game' do
    render 'namecreation'
  end

  post '/game-setup' do
    game = create_game
    running_games << game.add_player(create_player)
    render 'boardsetup', board: game.player1.board, ships: game.p1ships
  end

end
