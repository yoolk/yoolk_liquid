module Yoolk
  module Sandbox
    class Listing::OpeningHour < Yoolk::Sandbox::Base
      attribute     :id,          Integer
      attribute     :day,         Integer
      attribute     :open,        Yoolk::Sandbox::Hour
      attribute     :closed,      Yoolk::Sandbox::Hour
      attribute     :created_at,  DateTime
      attribute     :updated_at,  DateTime

      ## Delegate
      delegate      :hour,        to: :open,    prefix: true, allow_nil: true
      delegate      :minute,      to: :open,    prefix: true, allow_nil: true
      delegate      :hour,        to: :closed,  prefix: true, allow_nil: true
      delegate      :minute,      to: :closed,  prefix: true, allow_nil: true

      def today?
        day == Date.today.cwday
      end

      def full_day?
        open_hour.to_i == 0 && closed_hour.to_i == 23 && open_minute.to_i == 0 && closed_minute.to_i == 59
      end

      def open?
        !closed?
      end

      def closed?
        open.nil? && closed.nil?
      end
    end
  end
end
