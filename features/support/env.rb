require File.expand_path(File.dirname(__FILE__)+'/../../spec/spec_helper')
require 'haml'
require 'capybara/cucumber'

Capybara.app = SinX
SinX.set :environment, :development

World do
  def app
    @app = Rack::Builder.new do
      run MyApp::App
    end
  end
  include Rack::Test::Methods
  include Webrat::Methods
  include Webrat::Matchers
end