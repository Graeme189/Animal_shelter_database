require('sinatra')
require('sinatra/reloader')
require('pry-byebug')

require_relative('../models/animal')
require_relative('../models/owner')
also_reload('../models/*')

# SHOW OWNERS

get '/shelter/owners' do
  @owners = Owner.all
  erb(:"owners/all")
end

# SHOW OWNER

get '/shelter/owner/:id' do
  @owner = Owner.find(params[:id])
  erb(:"owners/show")
end

# CREATE NEW OWNER

get '/shelter/newowner' do
  erb(:"owners/new")
end

post '/shelter/newowner' do
  @owner = Owner.new(params)
  @owner.save()
  erb(:"owners/create")
end

# EDIT OWNER

get '/shelter/owner/:id/edit' do
  @owner = Owner.find(params[:id])
  erb(:"owners/edit")
end

post '/shelter/owner/:id' do # update
  Owner.new(params).update
  redirect to '/shelter/owners'
end

# DELETE OWNER

post '/shelter/owner/:id/delete' do # delete
  owner = Owner.find( params[:id] )
  owner.delete()
  redirect to '/shelter/owners'
end
