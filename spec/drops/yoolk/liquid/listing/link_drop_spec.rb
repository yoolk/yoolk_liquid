require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::LinkDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:title) }
      it { should have_attribute(:link) }
      it { should have_attribute(:description) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }
    end
  end
end