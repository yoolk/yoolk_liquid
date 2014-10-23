module Yoolk
  module Liquid
    class Listing::BusinessHourDrop < BaseDrop
      attributes  :id, :day, :created_at, :updated_at

      belongs_to  :open,     with: 'Yoolk::Liquid::HourDrop'
      belongs_to  :close,    with: 'Yoolk::Liquid::HourDrop'

      def full_day?
        open.hour.to_i  + close.hour.to_i == 23 && \
        open.minute.to_i + close.minute.to_i == 59
      end
    end
  end
end