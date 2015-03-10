environment = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/battleship_#{environment}")

#require './app/model/thing'

DataMapper.finalize
#DataMapper.auto_migrate!
