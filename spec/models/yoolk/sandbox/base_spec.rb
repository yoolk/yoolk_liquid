require 'rails_helper'

module Yoolk
  module Sandbox
    describe Base do
      it { should include_module(::Liquid::Rails::Droppable) }
      it { should respond_to(:read_attribute_for_serialization) }

      it '#drop_class' do
        expect(Yoolk::Sandbox::Listing.drop_class).to eq(Yoolk::Liquid::ListingDrop)
      end
    end
  end
end