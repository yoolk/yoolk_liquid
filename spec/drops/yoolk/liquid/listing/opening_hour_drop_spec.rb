require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::OpeningHourDrop do

      it { should have_attribute(:id) }
      it { should have_attribute(:day) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }
      it { should belongs_to(:open).with('Yoolk::Liquid::HourDrop') }
      it { should belongs_to(:close).with('Yoolk::Liquid::HourDrop') }
    end

    describe Listing::OpeningHourDrop, :method do
      let(:opening_hour) { Yoolk::Sandbox::Listing::OpeningHour.new({'day' => 0, 'open' => {'hour' => '07', 'minute' => '20'}, 'close' => {'hour' => '13', 'minute' => '20'}})}
      let(:opening_hour_drop) { Yoolk::Liquid::Listing::OpeningHourDrop.new(opening_hour)}

      it "#to_time, 12-hour based clock" do
        expect(opening_hour_drop.open.to_time).to eq("07:20 AM")
        expect(opening_hour_drop.close.to_time).to eq("01:20 PM")
      end
    end
  end
end