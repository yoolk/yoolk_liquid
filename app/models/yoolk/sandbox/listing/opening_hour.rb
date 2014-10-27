module Yoolk
  module Sandbox
    class Listing::OpeningHour < Yoolk::Sandbox::Base
      attribute     :id,          Integer
      attribute     :day,         Integer
      attribute     :open,        Yoolk::Sandbox::Hour
      attribute     :close,       Yoolk::Sandbox::Hour
      attribute     :created_at,  DateTime
      attribute     :updated_at,  DateTime

      ## Delegate
      delegate      :hour,        to: :open,  prefix: true
      delegate      :minute,      to: :open,  prefix: true
      delegate      :hour,        to: :close, prefix: true
      delegate      :minute,      to: :close, prefix: true

      def full_day?
        open_hour.to_i == 0 && close_hour.to_i == 23 && open_minute.to_i == 0 && close_minute.to_i == 59
      end

      def closed?
        open.nil? && close.nil?
      end
    end
  end
end
