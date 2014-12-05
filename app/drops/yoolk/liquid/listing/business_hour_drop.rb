module Yoolk
  module Liquid
    class Listing::BusinessHourDrop < BaseDrop
      attributes  :id, :day, :today?, :full_day?, :open?, :closed?,
                  :created_at, :updated_at

      def open
        @open   ||= Yoolk::Liquid::HourDrop.new(object.open.to_s)
      end

      def closed
        @closed ||= Yoolk::Liquid::HourDrop.new(object.closed.to_s)
      end

      def day_name
        I18n.t(:'date.day_names')[object.day]
      end

      def abbr_day_name
        I18n.t(:'date.abbr_day_names')[object.day]
      end
    end
  end
end