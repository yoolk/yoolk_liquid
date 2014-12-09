require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::CommunicationDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:type) }
      it { should have_attribute(:label) }
      it { should have_attribute(:value) }
      it { should have_attribute(:is_first_line) }
      it { should have_attribute(:image_url) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }

      it { should respond_to(:li) }
      it { should respond_to(:value_with_http) }
      it { should respond_to(:communication) }

    end

    describe Listing::CommunicationDrop do

      context 'branch office or department' do

        it 'branch office returns span of label value when value is not being set' do
          communication_drop = described_class.new(Yoolk::Sandbox::Listing::Communication.new(type: "Branch Office", label: "Yellow Tower - Siem Reap"))
          communication_drop.context = context
          expect(communication_drop.li).to eq("<span>Yellow Tower - Siem Reap</span>")
        end

        it 'branch office returns li when value is set' do
          communication_drop = described_class.new(Yoolk::Sandbox::Listing::Communication.new(type: "Branch Office", value: "Yellow Tower - Siem Reap"))
          communication_drop.context = context
          expect(communication_drop.li).to eq("<li><span>Branch Office</span><span title=\"Yellow Tower - Siem Reap\">Yellow Tower - Siem Reap</span></li>")
        end

        it 'department returns span of label value when value is not being set' do
          communication_drop = described_class.new(Yoolk::Sandbox::Listing::Communication.new(type: "department", label: "Yellow Tower - Siem Reap"))
          communication_drop.context = context
          expect(communication_drop.li).to eq("<span>Yellow Tower - Siem Reap</span>")
        end

        it 'department returns li when value is set' do
          communication_drop = described_class.new(Yoolk::Sandbox::Listing::Communication.new(type: "department", value: "Yellow Tower - Siem Reap"))
          communication_drop.context = context
          expect(communication_drop.li).to eq("<li><span>department</span><span title=\"Yellow Tower - Siem Reap\">Yellow Tower - Siem Reap</span></li>")
        end

      end

    end
  end
end