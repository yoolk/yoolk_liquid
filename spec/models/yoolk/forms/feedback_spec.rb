require 'rails_helper'

module Yoolk
  module Form
    describe Contact do
      it 'has :name attribute' do
        expect(described_class).to have_attribute(:name).of_type(String)
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
          contact = described_class.new("#{field}" => nil)
          contact.valid?

          expect(contact.errors[field]).to include("You can't leave this empty")
        end
      end
    end
  end
end