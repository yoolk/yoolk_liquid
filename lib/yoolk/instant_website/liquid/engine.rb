module Yoolk
  module InstantWebsite
    module Liquid
      class Engine < ::Rails::Engine
        isolate_namespace Yoolk::InstantWebsite::Liquid
      end
    end
  end
end
