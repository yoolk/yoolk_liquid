module Yoolk
  module Liquid
    class I18nDrop < BaseDrop
      def initialize
      end

      def day_names
        I18n.t(:'date.day_names')
      end

      def abbr_day_names
        I18n.t(:'date.abbr_day_names')
      end
    end
  end
end