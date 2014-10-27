require 'rails_helper'

module Yoolk
  module Liquid
    describe HourDrop do
      it { should have_attribute(:hour) }
      it { should have_attribute(:minute) }
    end
  end
end