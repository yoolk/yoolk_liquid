module Yoolk
  module Liquid
    class Listing::BusinessHourDrop < BaseDrop
      attributes  :id, :day, :full_day?, :closed?,
                  :open_hour, :close_hour, :open_minute, :close_minute,
                  :created_at, :updated_at

      belongs_to  :open,     with: 'Yoolk::Liquid::HourDrop'
      belongs_to  :close,    with: 'Yoolk::Liquid::HourDrop'

    end
  end
end