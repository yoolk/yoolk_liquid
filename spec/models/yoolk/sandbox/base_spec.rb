require 'rails_helper'

module Yoolk
  module Sandbox
    describe Base do
      it { should include_module(::Liquid::Rails::Droppable) }

      it '#drop_class' do
        expect(Yoolk::Sandbox::Listing.drop_class).to eq(Yoolk::Liquid::ListingDrop)
      end
    end
  end
end