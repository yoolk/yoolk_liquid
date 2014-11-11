require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::ShortDescriptionDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:text) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }

      it { should have_many(:categories).with('Yoolk::Liquid::Listing::CategoryDrop') }
    end
  end
end