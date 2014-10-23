require 'rails_helper'

module Yoolk
  module Liquid
    describe RequestDrop do

      it '#root_path' do
        expect(subject.root_path).to eq('/')
      end

      it '#office_path' do
        expect(subject.office_path).to eq('/office')
      end

      it '#galleries_path' do
        expect(subject.galleries_path).to eq('/galleries')
      end

      it '#people_path' do
        expect(subject.people_path).to eq('/people')
      end

      it '#brochures_path' do
        expect(subject.brochures_path).to eq('/brochures')
      end

      it '#map_path' do
        expect(subject.map_path).to eq('/map')
      end

      it '#products_path' do
        expect(subject.products_path).to eq('/products')
      end

      it '#services_path' do
        expect(subject.services_path).to eq('/services')
      end

      it '#menu_path' do
        expect(subject.menu_path).to eq('/menu')
      end

      it '#announcements_path' do
        expect(subject.announcements_path).to eq('/announcements')
      end

      it '#about_us_path' do
        expect(subject.about_us_path).to eq('/about_us')
      end

      it '#contact_us_path' do
        expect(subject.contact_us_path).to eq('/contact_us')
      end

      it '#reservation_path' do
        expect(subject.reservation_path).to eq('/reservation')
      end

      it '#feedback_path' do
        expect(subject.feedback_path).to eq('/feedback')
      end
    end
  end
end