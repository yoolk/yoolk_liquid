require 'rails_helper'

module Yoolk
  module Liquid
    module ServiceCatalog
      describe ServiceDrop do
        it { should have_attribute(:id) }
        it { should have_attribute(:name) }
        it { should have_attribute(:description) }
        it { should have_attribute(:properties) }
        it { should have_many(:photos).with('Yoolk::Liquid::Attachment') }
      end
    end
  end
end