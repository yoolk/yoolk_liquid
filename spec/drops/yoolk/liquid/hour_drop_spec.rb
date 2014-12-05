require 'rails_helper'

module Yoolk
  module Liquid
    describe HourDrop do
      let(:hour_drop) { Yoolk::Liquid::HourDrop.new('08:30') }

      it 'initializes from string' do
        expect(hour_drop).to be_instance_of(Yoolk::Liquid::HourDrop)
      end

      it '#hour' do
        expect(hour_drop.hour).to eq('08')
      end

      it '#minute' do
        expect(hour_drop.minute).to eq('30')
      end

      it '#to_s' do
        expect(hour_drop.to_s).to eq('08:30')
      end

      it '#strftime' do
        expect(hour_drop.strftime('%I:%M %p')).to eq('08:30 AM')
      end
    end
  end
end