require 'rails_helper'

module Yoolk
  module Liquid
    describe PositionLevelDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:name) }
      it { should have_attribute(:sort_order) }
    end
  end
end