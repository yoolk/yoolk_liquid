require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::BusinessPhotoDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:name) }
      it { should have_attribute(:embed_script) }
      it { should have_attribute(:description) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }
    end
  end
end