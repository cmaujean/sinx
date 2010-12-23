module SinX
  module Routes
    module CSS
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
end