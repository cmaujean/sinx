require 'spec_helper'

describe "GET '/css/:file'" do
  include Rack::Test::Methods
  
  it "returns a 404 error when the requested file does not exist" do
    set :precompiled_css, true
    get '/css/not_there.css'
    last_response.status.should == 404
  end
  
  it "returns the requested css from disk when options.precompiled_css == true" do
    set :precompiled_css, true
    get '/css/test.css'
    last_response.status.should == 200
    last_response.body.strip.should == 
'#container {
  font-size: 27px;
  border: #1d72e0 1px solid;
}'
    last_response.content_type.should =~ /^text\/css/
  end
  
  it "compiles and returns the requested css dynamically when options.precompiled_css == false" do
    set :precompiled_css, false
    get '/css/test_pre.css'
    last_response.status.should == 200
    last_response.body.strip.should == '#container { font-size: 30px; }'
    last_response.content_type.should =~ /^text\/css/
  end
  
end