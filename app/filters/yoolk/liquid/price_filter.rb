module Yoolk
  module Liquid
    module PriceFilter

      def to_currency(price)
        "#{currency}#{price}"
      end

      private

      def currency
        # It will be implemented to get currency of the listing
        # when there is currency setting in office.

        "$"
      end
    end
  end
end

Liquid::Template.register_filter Yoolk::Liquid::PriceFilter