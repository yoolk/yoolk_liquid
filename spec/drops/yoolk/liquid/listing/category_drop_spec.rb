require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::CategoryDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:alias_id) }
      it { should have_attribute(:short_name) }
      it { should have_attribute(:name) }
      it { should have_attribute(:description) }
      it { should have_attribute(:keyword) }
      it { should have_attribute(:display_on_web) }
      it { should have_attribute(:listings_count) }
      it { should have_attribute(:sub_categories_count) }
      it { should have_attribute(:level) }
      it { should belongs_to(:short_description).class_name('Yoolk::Liquid::Listing::ShortDescription') }
    end
  end
end