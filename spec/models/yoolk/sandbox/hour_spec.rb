require 'rails_helper'

module Yoolk
  module Sandbox
    describe Hour do
      it 'has :hour attribute' do
        expect(described_class).to have_attribute(:hour).of_type(String)
      end

      it 'has :minute attribute' do
        expect(described_class).to have_attribute(:minute).of_type(String)
      end
    end
  end
end