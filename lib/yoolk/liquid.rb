require 'yoolk/liquid/engine'

module Yoolk
  module Liquid
  end
end

Dir["#{Yoolk::Liquid::Engine.root}/app/{tags,filters}/**/*.rb"].each { |f| require f }