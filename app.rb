require( 'sinatra' )
require( 'sinatra/reloader' )
require('pry-byebug')

require_relative('controllers/animals_controller')
require_relative('controllers/owners_controller')

get '/shelter' do
  erb( :index )
end
