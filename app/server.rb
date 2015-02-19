require_relative 'lib/player'
require_relative 'lib/board'
require 'sinatra/base'


class BattleshipServer < Sinatra::Base





  enable :sessions

  # New Game.. is there a way to do this
  # everytime the /newgame page is visited?

  board1 = Board.new
  player1 = Player.new(homeboard: board1)


  get '/' do
    erb :index
  end

  get '/newgame' do


    erb :newgame
  end

  post '/play' do

    @name = params[:name]

    @board1 = board1


    erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
