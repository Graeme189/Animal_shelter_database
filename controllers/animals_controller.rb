require('sinatra')
require('sinatra/reloader')
require('pry-byebug')

require_relative('../models/animal')
require_relative('../models/owner')
also_reload('../models/*')

# SHOW ANIMALS

get '/shelter/animals' do
  @animals = Animal.all()
  erb(:"animals/all")
end

# SHOW ANIMAL

get '/shelter/animal/:id' do
  @animal = Animal.find(params[:id])
  erb(:"animals/show")
end

# CREATE NEW ANIMAL

get '/shelter/newanimal' do
  erb(:"animals/new")
end

post '/shelter/newanimal' do
  params["adoption_ready"] = "f" if !params["adoption_ready"]
  @animal = Animal.new(params)
  @animal.save()
  erb(:"animals/create")
end

# EDIT ANIMAL

get '/shelter/animals/:id/edit' do
  @owners = Owner.all()
  @animal = Animal.find(params[:id])
  erb(:"animals/edit")
end

post '/shelter/animal/:id' do
  params.delete("owner_id") if params["owner_id"] == ""
  params["adoption_ready"] = "f" if !params["adoption_ready"]
  Animal.new(params).update
  redirect to '/shelter/animals'
end

# SHOW ANIMALS READY FOR ADOPTION

get '/shelter/animals/adoption-ready' do
  @animals = Animal.find_adoption_ready(true)
  erb(:"animals/adoptionready")
end

get '/shelter/animals/not-adoption-ready' do
  @animals = Animal.find_adoption_ready(false)
  erb(:"animals/notadoptionready")
end

# SHOW ANIMALS BY BREED

get '/shelter/animals/bybreed' do
  @animals = Animal.sort_by_breed()
  erb(:"animals/bybreed")
end

# SHOW ANIMALS BY TYPE

get '/shelter/animals/bytype' do
  @animals = Animal.sort_by_type()
  erb(:"animals/bytype")
end

# DELETE ANIMAL

post '/shelter/animals/:id/delete' do # delete
  animal = Animal.find( params[:id] )
  animal.delete()
  redirect to '/shelter/animals'
end
