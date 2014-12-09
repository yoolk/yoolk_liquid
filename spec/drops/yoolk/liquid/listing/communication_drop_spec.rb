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

        it 'returns <span>label</span> when type is not branch office or department and value is not set' do
          communication_drop = described_class.new(Yoolk::Sandbox::Listing::Communication.new(type: "e-mail", label: "Yellow Tower - Siem Reap"))
          communication_drop.context = context
          expect(communication_drop.li).to eq("<span>Yellow Tower - Siem Reap</span>")
        end

        it 'returns <span>label</span> when type is not branch office or department and value is not set' do
          communication_drop = described_class.new(Yoolk::Sandbox::Listing::Communication.new(type: "e-mail", label: "Yellow Tower - Siem Reap"))
          communication_drop.context = context
          expect(communication_drop.li).to eq("<span>Yellow Tower - Siem Reap</span>")
        end

        it 'returns email list item when type is e-mail and value is set' do
          communication_drop = described_class.new(Yoolk::Sandbox::Listing::Communication.new(type: "e-mail", value: "Yellow Tower - Siem Reap"))
          communication_drop.context = context
          expect(communication_drop.li).to eq("<li><span>e-mail</span><span title=\"Yellow Tower - Siem Reap\"><a href=\"mailto:Yellow Tower - Siem Reap\" rel=\"tooltip\" title=\"Yellow Tower - Siem Reap\">Yellow Tower - Siem Reap</a></span></li>")
        end

        it 'returns ... when type is website' do
          communication_drop = described_class.new(Yoolk::Sandbox::Listing::Communication.new(type: "website", value: "www.yellow-tower.com"))
          communication_drop.context = context
          expect(communication_drop.li).to eq("<li><span>website</span><span title=\"www.yellow-tower.com\"><a href=\"http://www.yellow-tower.com\" rel=\"tooltip\" title=\"www.yellow-tower.com\">www.yellow-tower.com</a></span></li>")
        end

        it 'returns ... when type is facebook' do
          communication_drop = described_class.new(Yoolk::Sandbox::Listing::Communication.new(type: "facebook", value: "http://www.facebook.com/pages/Ladder-technology-industrial-sdn-bhd-03-3325-9415/508871785815117?sk=app_442217585812642"))
          communication_drop.context = context
          expect(communication_drop.li).to eq("<li><span>facebook</span><span title=\"http://www.facebook.com/pages/Ladder-technology-industrial-sdn-bhd-03-3325-9415/508871785815117?sk=app_442217585812642\"><a href=\"http://www.facebook.com/pages/Ladder-technology-industrial-sdn-bhd-03-3325-9415/508871785815117?sk=app_442217585812642\" rel=\"tooltip\" title=\"Ladder-technology-industrial-sdn-bhd-03-3325-9415\">Ladder-technology-industria...</a></span></li>")
        end

        it 'returns ... when type is twitter' do
          communication_drop = described_class.new(Yoolk::Sandbox::Listing::Communication.new(type: "twitter", value: "http://www.twitter.com/chamnap"))
          communication_drop.context = context
          expect(communication_drop.li).to eq("<li><span>twitter</span><span title=\"http://www.twitter.com/chamnap\"><a href=\"http://www.twitter.com/chamnap\" rel=\"tooltip\" title=\"chamnap\">chamnap</a></span></li>")
        end

      end

    end
  end
end