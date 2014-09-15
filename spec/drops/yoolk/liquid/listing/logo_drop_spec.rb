require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::LogoDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }
    end

    describe Listing::LogoDrop do
      subject { described_class.new(double) }

      it { should delegate(:styles).to(:object) }
      it { should delegate(:width).to(:object) }
      it { should delegate(:height).to(:object) }
      it { should delegate(:url).to(:object) }
    end
  end
end