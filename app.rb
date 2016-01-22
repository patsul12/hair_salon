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
  name = params[:name]
  Stylist.new({name: name}).save
  redirect '/'
end

get '/stylists/:id' do
  @stylist = Stylist.find(params[:id])
  @clients = @stylist.show_clients
  erb :stylist
end

post '/stylists/:id/add' do
  @stylist = Stylist.find(params[:id])
  client = Client.find(params[:client_name])
  if !client
    Client.new({name: params[:client_name], stylist_id: @stylist.id}).save
  end
  redirect "/stylists/#{@stylist.id}"
end

get '/clients/:id' do
  @client = Client.find(params[:id])
  @stylist = Stylist.find(@client.stylist_id)
  erb :client
end
