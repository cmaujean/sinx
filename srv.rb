require 'bundler'
Bundler.setup

require 'sinatra'

configure :development do
  set :precompiled_css, false
end

configure :production do
  set :precompiled_css, true
end

set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :haml, :format => :html5

Dir[settings.root + '/lib/**/*.rb'].each do |file|
  require file
end

include SinX::Routes