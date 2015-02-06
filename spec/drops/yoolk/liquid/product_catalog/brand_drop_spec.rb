require 'rails_helper'

module Yoolk
  module Liquid
    module ProductCatalog
      describe BrandDrop do
        it { should have_attribute(:id) }
        it { should have_attribute(:name) }
        it { should have_attribute(:created_at) }
        it { should have_attribute(:updated_at) }
      end
    end
  end
end