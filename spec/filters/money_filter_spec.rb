require 'rails_helper'
$:.unshift('../yoolk_engines/core/app/services/yoolk')
require 'money_formatter.rb'

module Yoolk
  module Liquid
    describe MoneyFilter do
      let(:listing) { build(:listing, currency: build(:currency, code: 'KHR')) }
      let(:drop)    { listing.to_liquid }
      it "#money" do
        expect_template_result("{{ 12.04 | money }}", "$ 12.04")
      end

      it "#money_with_currency" do
        expect_template_result("{{ 12.04 | money_with_currency }}", "KHR 12.04", { 'listing' => drop })
      end
    end
  end
end
