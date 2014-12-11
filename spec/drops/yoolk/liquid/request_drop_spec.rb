require 'rails_helper'

module Yoolk
  module Liquid
    describe RequestDrop do
      subject { described_class.new }

      it '#root_url' do
        expect(subject.root_url).to eq('/')
      end

      it '#office_url' do
        expect(subject.office_url).to eq('/office_v1')
      end

      it '#galleries_url' do
        expect(subject.galleries_url).to eq('/galleries')
      end

      it '#people_url' do
        expect(subject.people_url).to eq('/people')
      end

      it '#brochures_url' do
        expect(subject.brochures_url).to eq('/brochures')
      end

      it '#map_url' do
        expect(subject.map_url).to eq('/map')
      end

      it '#products_url' do
        expect(subject.products_url).to eq('/products')
      end

      it '#services_url' do
        expect(subject.services_url).to eq('/services')
      end

      it '#menu_url' do
        expect(subject.menu_url).to eq('/menu')
      end

      it '#announcements_url' do
        expect(subject.announcements_url).to eq('/announcements')
      end

      it '#about_us_url' do
        expect(subject.about_us_url).to eq('/about_us')
      end

      it '#contact_us_url' do
        expect(subject.contact_us_url).to eq('/contact_us')
      end

      it '#reservation_url' do
        expect(subject.reservation_url).to eq('/reservation')
      end

      it '#feedback_url' do
        expect(subject.feedback_url).to eq('/feedback')
      end

      it '#theme_name' do
        allow(subject.send(:request)).to receive(:params).and_return(theme: 'sample')

        expect(subject.theme_name).to eq('sample')
      end

      it '#style_name' do
        allow(subject.send(:request)).to receive(:params).and_return(style: 'gray')

        expect(subject.style_name).to eq('gray')
      end

      context '#js_class_name' do
        it 'action_name is other than #create and #update' do
          allow(subject).to receive(:action_name).and_return('index')

          expect(subject.js_class_name).to eq('Views.Application.IndexView')
        end

        it 'action_name is #create' do
          allow(subject).to receive(:action_name).and_return('create')

          expect(subject.js_class_name).to eq('Views.Application.NewView')
        end

        it 'action_name is #update' do
          allow(subject).to receive(:action_name).and_return('update')

          expect(subject.js_class_name).to eq('Views.Application.EditView')
        end
      end

      context '#preview_mode?' do
        it 'returns true' do
          allow(subject.send(:request)).to receive(:host).and_return('iw.yoolk.com')
          allow(subject.send(:request)).to receive(:params).and_return({ alias_id: 'kh2' })

          expect(subject.preview_mode?).to be_truthy
        end

        it 'returns false' do
          expect(subject.preview_mode?).to be_falsy
        end
      end

      context '#host' do
        it 'returns the rails\'s request host' do
          allow(subject.send(:request)).to receive(:host).and_return('localhost.com')

          expect(subject.host).to eq('localhost.com')
        end

        it 'returns the rails\'s request host without www.' do
          allow(subject.send(:request)).to receive(:host).and_return('www.localhost.com')

          expect(subject.host).to eq('localhost.com')
        end
      end
    end
  end
end