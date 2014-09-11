require 'rails_helper'

module Yoolk
  module Liquid
    module ServiceCatalog
      describe CategoryDrop do
        it { should have_attribute(:id) }
        it { should have_attribute(:name) }
        it { should have_attribute(:short_name) }
        it { should have_attribute(:description) }
        it { should have_many(:services).with('Yoolk::Liquid::ServiceCatalog::ServiceDrop') }
      end
    end
  end
end