require 'yoolk/instant_website/liquid/engine'

module Yoolk
  module InstantWebsite
    module Liquid
    end
  end
end

Dir[File.dirname(__FILE__) + '/liquid/{tags,filters,drops}/*.rb'].each { |f| require f }