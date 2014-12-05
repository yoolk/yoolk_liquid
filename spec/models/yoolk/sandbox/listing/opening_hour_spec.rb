require 'rails_helper'

module Yoolk
  module Sandbox
    describe Listing::OpeningHour do
      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(Integer)
      end

      it 'has :day attribute' do
        expect(described_class).to have_attribute(:day).of_type(Integer)
      end

      it 'has :open attribute' do
        expect(described_class).to have_attribute(:open).of_type(Yoolk::Sandbox::Hour)
      end

      it 'has :closed attribute' do
        expect(described_class).to have_attribute(:closed).of_type(Yoolk::Sandbox::Hour)
      end

      it 'has :created_at attribute' do
        expect(described_class).to have_attribute(:created_at).of_type(DateTime)
      end

      it 'has :updated_at attribute' do
        expect(described_class).to have_attribute(:updated_at).of_type(DateTime)
      end

      it 'respond_to :today?' do
        expect(subject).to respond_to(:today?)
      end

      it 'respond_to :full_day?' do
        expect(subject).to respond_to(:full_day?)
      end

      it 'respond_to :open?' do
        expect(subject).to respond_to(:open?)
      end

      it 'respond_to :closed?' do
        expect(subject).to respond_to(:closed?)
      end
    end

    describe Listing::OpeningHour do
      it { should delegate(:hour).to(:open).with_prefix }
      it { should delegate(:minute).to(:open).with_prefix }
      it { should delegate(:hour).to(:closed).with_prefix }
      it { should delegate(:minute).to(:closed).with_prefix }
    end
  end
end