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
    end

    describe Listing::CommunicationDrop, '#li' do
      let(:communication) { Yoolk::Sandbox::Listing::Communication.new }
      subject             { communication.to_liquid }

      it 'branch office returns span of label value when value is not being set' do
        communication.type  = 'Branch Office'
        communication.label = 'Yellow Tower - Siem Reap'

        expect(subject.li).to eq('<span>Yellow Tower - Siem Reap</span>')
      end

      it 'branch office returns li when value is set' do
        communication.type  = 'Branch Office'
        communication.value = 'Yellow Tower - Siem Reap'

        expect(subject.li).to eq("<li><span>Branch Office</span><span title=\"Yellow Tower - Siem Reap\">Yellow Tower - Siem Reap</span></li>")
      end

      it 'department returns span of label value when value is not being set' do
        communication.type  = 'department'
        communication.label = 'Yellow Tower - Siem Reap'

        expect(subject.li).to eq('<span>Yellow Tower - Siem Reap</span>')
      end

      it 'department returns li when value is set' do
        communication.type  = 'department'
        communication.value = 'Yellow Tower - Siem Reap'

        expect(subject.li).to eq("<li><span>department</span><span title=\"Yellow Tower - Siem Reap\">Yellow Tower - Siem Reap</span></li>")
      end

      it 'returns <span>label</span> when type is not branch office or department and value is not set' do
        communication.type  = "e-mail"
        communication.label = "Yellow Tower - Siem Reap"

        expect(subject.li).to eq("<span>Yellow Tower - Siem Reap</span>")
      end

      it 'returns <span>label</span> when type is not branch office or department and value is not set' do
        communication.type  = "e-mail"
        communication.label = "Yellow Tower - Siem Reap"

        expect(subject.li).to eq("<span>Yellow Tower - Siem Reap</span>")
      end

      it 'returns email list item when type is e-mail and value is set' do
        communication.type  = "e-mail"
        communication.value = "Yellow Tower - Siem Reap"

        expect(subject.li).to eq("<li><span>e-mail</span><span title=\"Yellow Tower - Siem Reap\"><a href=\"mailto:Yellow Tower - Siem Reap\" rel=\"tooltip\" title=\"Yellow Tower - Siem Reap\">Yellow Tower - Siem Reap</a></span></li>")
      end

      it 'returns website link when type is website' do
        communication.type  = "website"
        communication.value = "www.yellow-tower.com"

        expect(subject.li).to eq("<li><span>website</span><span title=\"www.yellow-tower.com\"><a href=\"http://www.yellow-tower.com\" rel=\"tooltip\" title=\"www.yellow-tower.com\">www.yellow-tower.com</a></span></li>")
      end

      it 'returns facebook link when type is facebook' do
        communication.type  = "facebook"
        communication.value = "http://www.facebook.com/pages/Ladder-technology-industrial-sdn-bhd-03-3325-9415/508871785815117?sk=app_442217585812642"

        expect(subject.li).to eq("<li><span>facebook</span><span title=\"http://www.facebook.com/pages/Ladder-technology-industrial-sdn-bhd-03-3325-9415/508871785815117?sk=app_442217585812642\"><a href=\"http://www.facebook.com/pages/Ladder-technology-industrial-sdn-bhd-03-3325-9415/508871785815117?sk=app_442217585812642\" rel=\"tooltip\" title=\"Ladder-technology-industrial-sdn-bhd-03-3325-9415\">Ladder-technology-industria...</a></span></li>")
      end

      it 'returns twitter link when type is twitter' do
        communication.type  = "twitter"
        communication.value = "http://www.twitter.com/chamnap"

        expect(subject.li).to eq("<li><span>twitter</span><span title=\"http://www.twitter.com/chamnap\"><a href=\"http://www.twitter.com/chamnap\" rel=\"tooltip\" title=\"chamnap\">chamnap</a></span></li>")
      end

      it 'returns simple list item with no link for none of the above condition' do
        communication.type  = "mobile phone"
        communication.value = "016 208 3915"

        expect(subject.li).to eq("<li><span>mobile phone</span><span title=\"016 208 3915\">016 208 3915</span></li>")
      end

      it 'mobile_phone? returns true when communication is type of Mobile Phone' do
        communication.type = "Mobile Phone"
        expect(subject.mobile_phone?).to eq(true)
      end

      it 'mobile_phone? returns true when communication is type of Mobile Phone' do
        communication.type = "Mobile Phone"
        expect(subject.mobile_phone?).to eq(true)
      end

      it 'email? returns true when communication is type of E-mail' do
        communication.type = "E-mail"
        expect(subject.email?).to eq(true)
      end

      it 'tel? returns true when communication is type of Tel' do
        communication.type = "Tel"
        expect(subject.tel?).to eq(true)
      end

      it 'fax? returns true when communication is type of Fax' do
        communication.type = "Fax"
        expect(subject.fax?).to eq(true)
      end

      it 'website? returns true when communication is type of Website' do
        communication.type = "Website"
        expect(subject.website?).to eq(true)
      end

      it 'facebook? returns true when communication is type of Facebook' do
        communication.type = "Facebook"
        expect(subject.facebook?).to eq(true)
      end

      it 'twitter? returns true when communication is type of Twitter' do
        communication.type = "Twitter"
        expect(subject.twitter?).to eq(true)
      end

    end
  end
end