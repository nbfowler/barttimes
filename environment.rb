require 'rubygems'
require 'haml'
require 'ostruct'

require 'sinatra' unless defined?(Sinatra)

configure do
  SiteConfig = OpenStruct.new(
                 :title => 'BART Times',
                 :author => 'Nicholas Fowler',
                 :url_base => 'http://localhost:4567/'
               )

  #  DataMapper.setup(:default, "sqlite3:///#{File.expand_path(File.dirname(__FILE__))}/#{Sinatra::Base.environment}.db")

  #  load models
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| require File.basename(lib, '.*') }
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/test")
  Dir.glob("#{File.dirname(__FILE__)}/test/*.rb") { |lib| require File.basename(lib, '.*') }
end
