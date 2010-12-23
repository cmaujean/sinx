require 'logger'
require 'less'

module SinX
  module Routes
    include SinX::Routes::Root
    include SinX::Routes::CSS
  end
end
