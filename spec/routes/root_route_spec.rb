require 'spec_helper'

describe "GET '/'" do
  include Rack::Test::Methods
   
  it "is successful" do
    get '/'
    last_response.should be_ok
  end
  
  it "has a title of 'Home'" do
    get '/'
    last_response.body.should =~ /SinX: Home/
  end
end