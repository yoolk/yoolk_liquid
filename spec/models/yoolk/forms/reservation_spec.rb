require 'rails_helper'

module Yoolk
  module Form
    describe Reservation do
      it 'has :check_in attribute' do
        expect(described_class).to have_attribute(:check_in).of_type(String)
      end

      it 'has :check_out attribute' do
        expect(described_class).to have_attribute(:check_out).of_type(String)
      end

      it 'has :guests attribute' do
        expect(described_class).to have_attribute(:guests).of_type(String)
      end

      it 'has :room_types attribute' do
        expect(described_class).to have_attribute(:room_types).of_type(String)
      end

      it 'has :name attribute' do
        expect(described_class).to have_attribute(:name).of_type(String)
      end

      it 'has :phone attribute' do
        expect(described_class).to have_attribute(:phone).of_type(String)
      end

      it 'has :sender attribute' do
        expect(described_class).to have_attribute(:sender).of_type(String)
      end

      it 'has :body attribute' do
        expect(described_class).to have_attribute(:body).of_type(String)
      end

      it { should allow_value("abc@yoolk.com").for(:sender) }

      it { should_not allow_value("yoolk.com").for(:sender) }

      [:sender, :body].each do |field|
        it "validates #{field}" do
          reservation = Reservation.new("#{field}" => nil)
          reservation.valid?

          expect(reservation.errors[field]).to include("You can't leave this empty")
        end
      end
    end
  end
end