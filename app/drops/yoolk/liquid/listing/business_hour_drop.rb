module Yoolk
  module Liquid
    class Listing::BusinessHourDrop < BaseDrop
      attributes  :id, :day, :created_at, :updated_at

      belongs_to  :open,     with: 'Yoolk::Liquid::HourDrop'
      belongs_to  :close,    with: 'Yoolk::Liquid::HourDrop'
    end
  end
end