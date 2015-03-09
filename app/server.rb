require 'hobbit'
require 'hobbit/contrib'
require_relative 'custom-hobbit'

class Server < Hobbit::Base
  include Hobbit::Mote


  get '/' do
    render 'index'
  end


end
