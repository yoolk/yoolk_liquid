require 'yoolk/liquid/engine'

module Yoolk
  module Liquid
  end
end

Dir["#{Yoolk::Liquid::Engine.root}/app/{tags,filters,drops}/*.rb"].each { |f| require f }