require 'rails_helper'

module Yoolk
  module Sandbox
    describe Account do
      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(Integer)
      end

      it 'has :person attribute' do
        expect(described_class).to have_attribute(:person).of_type(Yoolk::Sandbox::Person)
      end

      it { should delegate(:avatar).to(:person) }
    end
  end
end