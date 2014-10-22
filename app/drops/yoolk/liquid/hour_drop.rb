module Yoolk
  module Liquid
    class HourDrop < BaseDrop
      attributes  :id, :hour, :minute, :created_at, :updated_at

      def to_time
        t  = "#{hour}:#{minute}"

        Time.parse(t).strftime("%I:%M %p")
      end
    end
  end
end