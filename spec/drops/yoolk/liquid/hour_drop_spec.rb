require 'rails_helper'

module Yoolk
  module Liquid
    describe HourDrop do

      it { should have_attribute(:id) }
      it { should have_attribute(:hour) }
      it { should have_attribute(:minute) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }
    end
    describe HourDrop, :method do
      let(:hour) { Yoolk::Sandbox::Hour.new({'hour'=>'17', 'minute'=>'30'})}
      let(:hour_drop) { Yoolk::Liquid::HourDrop.new(hour)}

      it { should respond_to(:to_time) }

      it "#to_time" do
        expect(hour_drop.to_time).to eq(Time.parse("#{hour_drop.hour}:#{hour_drop.minute}"))
      end
    end
  end
end