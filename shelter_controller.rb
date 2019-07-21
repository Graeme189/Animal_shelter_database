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

get '/shelter/animal/:id' do
  @animal = Animal.find(params[:id])
  erb(:showanimal)
end

get '/shelter/owner/:id' do
  @owner = Owner.find(params[:id])
  erb(:showowner)
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

# EDIT ANIMAL
get '/shelter/animal/:id/edit' do
  @animal = Animal.find(params[:id])
  erb(:editanimal)
end

post '/shelter/animal/:id' do # update
  Animal.new(params).update
  redirect to '/shelter/animals'
end

# EDIT OWNER
get '/shelter/owner/:id/edit' do
  @owner = Owner.find(params[:id])
  erb(:editowner)
end

post '/shelter/owner/:id' do # update
  Owner.new(params).update
  redirect to '/shelter/owners'
end
