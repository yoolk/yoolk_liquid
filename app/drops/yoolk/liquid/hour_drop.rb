module Yoolk
  module Liquid
    class HourDrop < BaseDrop
      def initialize(value)
        @value      = value
        @attributes = {
          'hour'   => value.to_s.split(':')[0],
          'minute' => value.to_s.split(':')[1]
        }
      end

      def hour
        @attributes['hour']
      end

      def minute
        @attributes['minute']
      end

      def to_s
        @value
      end

      def strftime(format)
        Time.parse(to_s).strftime(format)
      end
    end
  end
end