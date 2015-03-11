require 'hobbit'
require 'hobbit/contrib'
require 'data_mapper'
require_relative 'custom-hobbit'
require_relative 'data_mapper_setup'

require_relative 'game_setup'


class Server < Hobbit::Base
  include Hobbit::Mote
  include Hobbit::Session



  get '/' do
    render 'index'
  end

  get '/new-game' do
    render 'namecreation'
  end

  get '/game-setup' do

    board = Board.new
    puts "---- #{params[:name]}"
    player = Player.new(name:"Hi there", board:board)
    game = create_game
    game.add_player(player)
    render 'boardsetup', game: game
  end

end
