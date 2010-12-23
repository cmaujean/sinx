require 'logger'
require 'less'

module SinX
  module Routes

    before do
      @title ||= ": Home"
    end

    get '/' do
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
end
