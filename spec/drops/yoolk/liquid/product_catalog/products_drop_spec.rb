require 'rails_helper'

module Yoolk
  module Liquid
    module ProductCatalog
      describe ProductsDrop do
        it { should have_scope(:storefronts) }
      end
    end
  end
end