require File.join(File.dirname(__FILE__), '..', 'srv.rb')
require 'rack/test'
require 'sinatra'

set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

def app
   @app ||= Sinatra::Application
end

