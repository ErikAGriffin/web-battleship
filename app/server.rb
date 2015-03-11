require 'hobbit'
require 'hobbit/contrib'
require 'data_mapper'
require_relative 'custom-hobbit'
require_relative 'data_mapper_setup'

# Hmm where best to put these..
require_relative 'model/board'


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

    render 'boardsetup', board: board
  end

end
