require './app/server'
require 'rack/protection'

use Rack::Session::Cookie, secret: SecureRandom.hex(64)
use Rack::Protection

use Rack::Static, root: 'public', urls:['/images','/styles']

run Server.new
