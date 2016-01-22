require 'sinatra'
require 'sinatra/reloader'
also_reload('./**/*.rb')
require './lib/client'
require './lib/stylist'
require 'pg'

DB = PG.connect({dbname: 'hair_salon'})

get '/' do
  @stylists = Stylist.all
  erb :index
end

post '/stylist/add' do
  name = params[:name]
  Stylist.new({name: name}).save
  redirect '/'
end
