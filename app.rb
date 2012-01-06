require 'rubygems'
require 'sinatra'
require 'environment'
require 'bart/station'

get '/' do
  haml :index
end

get '/station/:abbr' do
  @station = Bart::Station.new(params[:abbr])
  haml :station
end
