require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::BusinessHourDrop do

      it { should have_attribute(:id) }
      it { should have_attribute(:day) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }
      it { should belongs_to(:open).with('Yoolk::Liquid::HourDrop') }
      it { should belongs_to(:close).with('Yoolk::Liquid::HourDrop') }
    end

    describe Listing::BusinessHourDrop, :method do
      let(:business_hour) { Yoolk::Sandbox::Listing::OpeningHour.new({'day' => 0, 'open' => {'hour' => '07', 'minute' => '20'}, 'close' => {'hour' => '13', 'minute' => '20'}})}
      let(:business_hour_drop) { Yoolk::Liquid::Listing::BusinessHourDrop.new(business_hour)}

      it "#to_time, 12-hour based clock" do
        open_time = "#{business_hour_drop.open.hour}:#{business_hour_drop.open.minute}"
        close_time = "#{business_hour_drop.close.hour}:#{business_hour_drop.close.minute}"

        expect(business_hour_drop.open.to_time).to eq(Time.parse(open_time))
        expect(business_hour_drop.close.to_time).to eq(Time.parse(close_time))
      end
    end
  end
end