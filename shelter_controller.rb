require('sinatra')
require('sinatra/reloader')
require('pry-byebug')

require_relative('./models/animal')
require_relative('./models/owner')
also_reload('./models/*')

get '/shelter' do
  erb(:index)
end

get '/shelter/animals' do
  @animals = Animal.all()
  erb(:animals)
end
