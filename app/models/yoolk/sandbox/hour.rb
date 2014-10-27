module Yoolk
  module Sandbox
    class Hour < Yoolk::Sandbox::Base
      attribute :hour,        String
      attribute :minute,      String

      def to_s
        "#{hour}:#{minute}"
      end
    end
  end
end