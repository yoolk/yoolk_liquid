module Yoolk
  module Liquid
    class HourDrop < BaseDrop
      attributes  :hour, :minute, :to_s

      def to_s
        object.to_s
      end

      def strftime(format)
        Time.parse(to_s).strftime(format)
      end
    end
  end
end