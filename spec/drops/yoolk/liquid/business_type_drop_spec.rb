require 'rails_helper'

module Yoolk
  module Liquid
    describe BusinessTypeDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:name) }
      it { should have_attribute(:display_order) }
      it { should have_attribute(:group_number) }
    end
  end
end