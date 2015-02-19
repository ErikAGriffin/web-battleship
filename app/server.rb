require 'sinatra/base'


class BattleshipServer < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/' do
    erb :index
  end

  get '/newgame' do
    erb :newgame
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
