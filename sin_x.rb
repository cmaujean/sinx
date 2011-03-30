require 'sinatra'
require 'less'

class SinX < Sinatra::Base

  configure :development do
    set :precompiled_css, false
  end

  configure :production do
    set :precompiled_css, true
  end

  set :app_file, __FILE__
  set :root, File.dirname(__FILE__)
  set :haml, :format => :html5
  enable :sessions

  get '/' do
    @title = ": Home"
    haml :index
  end

  get '/css/:file' do
    content_type :css
    if options.precompiled_css
      cssfile = File.join(settings.root, 'css', params[:file])
      error(404) unless File.exists? cssfile
      File.read(cssfile)
    else
      lessfile = File.join(settings.root, 'css', File.basename(params[:file], '.css') + '.less')
      error(404) unless File.exists? lessfile
      Less.parse File.read(lessfile)
    end  
  end

end