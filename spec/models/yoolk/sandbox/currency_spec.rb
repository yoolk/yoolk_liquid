require 'rails_helper'

module Yoolk
  module Sandbox
    describe Currency do

      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(String)
      end

      it 'has :code attribute' do
        expect(described_class).to have_attribute(:code).of_type(String)
      end

    end
  end
end