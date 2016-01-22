require 'sinatra'
require 'sinatra/reloader'
also_reload('./**/*.rb')
require './lib/client'
require './lib/stylist'
require 'pg'

DB = PG.connect({dbname: 'hair_salon'})

get '/' do
  @stylists = Stylist.all
  @clients = Client.all
  erb :index
end

post '/stylists/add' do
  name = params[:stylist_name]
  Stylist.new({name: name}).save
  redirect '/'
end

delete '/stylists/delete' do
  name = params[:name]
  stylist = Stylist.find_by_name(name)
  stylist.each {|s| s.remove}
  redirect '/'
end

get '/stylists/:id' do
  @stylist = Stylist.find(params[:id])
  @clients = @stylist.show_clients
  @all_clients = Client.all
  erb :stylist
end

post '/stylists/:id/add' do
  @stylist = Stylist.find(params[:id])
  client = Client.find_by_name(params[:client_name])
  if client.empty?
    Client.new({name: params[:client_name], stylist_id: @stylist.id}).save
  else
    client.each { |c| c.update_stylist(@stylist.id) }
  end
  redirect "/stylists/#{@stylist.id}"
end

patch '/stylists/:id/update' do
  @stylist = Stylist.find(params[:id])
  @stylist.update(params[:name])
  redirect "/stylists/#{@stylist.id}"
end

patch '/stylists/:id/update_clients' do
  client = Client.find_by_name(params[:name])
  client.each { |c| c.update_stylist(nil) }
  redirect "/stylists/#{params[:id]}"
end

get '/clients/:id' do
  @client = Client.find(params[:id])
  @stylist = Stylist.find(@client.stylist_id)
  erb :client
end

patch '/clients/:id/update' do
  @client = Client.find(params[:id])
  @client.update(params[:name])
  redirect "/clients/#{@client.id}"
end

post '/clients/add' do
  name = params[:client_name]
  Client.new({name: name}).save
  redirect '/'
end

delete '/clients/delete' do
  name = params[:name]
  client = Client.find_by_name(name)
  client.each {|c| c.remove}
  redirect '/'
end
