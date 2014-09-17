require 'rails_helper'

module Yoolk
  module Liquid
    describe LocationDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:alias_id) }
      it { should have_attribute(:name) }
      it { should have_attribute(:priority) }
      it { should have_attribute(:show_on_web) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }
    end
  end
end