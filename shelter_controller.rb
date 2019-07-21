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

get '/shelter/newanimal' do # new
  erb(:newanimal)
end

post '/shelter' do # create
  @animal = Animal.new(params)
  @animal.save()
  erb(:create)
end
