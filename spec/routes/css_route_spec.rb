require 'spec_helper'

describe "GET '/css/:file'" do
  include Rack::Test::Methods

  describe "when settings.precompiled_css == true" do
    before :each do
      set :precompiled_css, true
    end

    it "returns a 404 error when the requested file does not exist" do
      get '/css/not_there.css'
      last_response.status.should == 404
    end

    it "returns the requested css from disk when options.precompiled_css == true" do
      get '/css/test.css'
      last_response.status.should == 200
      last_response.content_type.should =~ /^text\/css/

      response_body = Less::Engine.new(last_response.body)
      comparison = Less::Engine.new(
        '#container {
          font-size: 27px;
          border: #1d72e0 1px solid;
        }'
      )

      response_body.to_css.should == comparison.to_css
    end
  end

  describe "when settings.precompiled_css == false" do
    before :each do
      set :precompiled_css, false
    end

    it "returns a 404 error when the requested file does not exist" do
      get '/css/not_there.css'
      last_response.status.should == 404
    end
    it "compiles and returns the requested css dynamically" do

      get '/css/test_pre.css'
      last_response.status.should == 200
      last_response.body.strip.should == '#container { font-size: 30px; }'
      last_response.content_type.should =~ /^text\/css/
    end
  end

end