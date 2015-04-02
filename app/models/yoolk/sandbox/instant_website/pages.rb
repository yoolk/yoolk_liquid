module Yoolk
  module Sandbox
    module InstantWebsite
      class Pages < Collection
        def new(attributes={})
          Yoolk::Sandbox::InstantWebsite::Page.new(attributes)
        end
      end
    end
  end
end