require('sinatra')
require('sinatra/reloader')
require('pry-byebug')

require_relative('./models/animal')
require_relative('./models/owner')
also_reload('./models/*')

get '/shelter' do # home
  erb(:index)
end

get '/shelter/animals' do # show animals
  @animals = Animal.all()
  erb(:animals)
end

get '/shelter/owners' do # show owners
  @owners = Owner.all
  erb(:owners)
end

get '/shelter/newanimal' do # new animal
  erb(:newanimal)
end

post '/shelter/newanimal' do # post create new animal
  @animal = Animal.new(params)
  @animal.save()
  erb(:create)
end

get '/shelter/newowner' do # new owner
  erb(:newowner)
end

post '/shelter/newowner' do # post create new owner
  @owner = Owner.new(params)
  @owner.save()
  erb(:createowner)
end
