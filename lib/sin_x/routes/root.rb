module SinX
  module Routes
    module Root
      get '/' do
        @title = ": Home"
        haml :index
      end
    end
  end
end
