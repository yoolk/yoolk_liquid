require 'rails_helper'

module Yoolk
  module Liquid
    describe PriceFilter do
      it '#to_currency' do
        expect_template_result("{{ 12.04 | to_currency }}", "$12.04")
      end
    end
  end
end