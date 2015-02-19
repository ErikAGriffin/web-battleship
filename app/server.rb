require_relative 'lib/board'
require 'sinatra/base'


class BattleshipServer < Sinatra::Base





  enable :sessions

  board1 = Board.new

  get '/' do
    erb :index
  end

  get '/newgame' do


    erb :newgame
  end

  post '/play' do

    @name = params[:name]
    puts board1.inspect

    erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
