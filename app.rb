require 'rubygems'
require 'sinatra'
require 'environment'
require 'awesome_print'

get '/' do
  #  station_list = Bart::Station::LIST
  haml :index
end

get '/station/:abbr' do
  @station = Bart::Station.new(params[:abbr])
  haml :station
end
