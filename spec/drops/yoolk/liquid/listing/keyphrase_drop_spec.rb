require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::KeyphraseDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:text) }
      it { should have_attribute(:position) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }
    end
  end
end