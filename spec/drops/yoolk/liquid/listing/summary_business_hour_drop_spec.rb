require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::SummaryBusinessHourDrop do
      let(:open)    { Yoolk::Liquid::HourDrop.new('8:30') }
      let(:closed)  { Yoolk::Liquid::HourDrop.new('18:30') }
      subject       { Yoolk::Liquid::Listing::SummaryBusinessHourDrop.new([1,3,4,5], open, closed) }

      it '#days' do
        expect(subject.days).to eq([1,3,4,5])
      end

      it '#day_names' do
        expect(subject.day_names).to eq(['Monday', 'Wednesday', 'Thursday', 'Friday'])
      end

      it '#abbr_day_names' do
        expect(subject.abbr_day_names).to eq(['Mon', 'Wed', 'Thu', 'Fri'])
      end

      it '#day_name' do
        expect(subject.day_name).to eq('Monday,Wednesday-Friday')
      end

      it '#abbr_day_name' do
        expect(subject.abbr_day_name).to eq('Mon,Wed-Fri')
      end

      it '#open' do
        expect(subject.open).to eq(open)
      end

      it '#closed' do
        expect(subject.closed).to eq(closed)
      end
    end
  end
end