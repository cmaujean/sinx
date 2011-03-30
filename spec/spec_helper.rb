require 'rack/test'
require File.join(File.dirname(__FILE__), '..' + '/sin_x.rb')
require 'webrat'

set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

def app
   @app ||= SinX
end

