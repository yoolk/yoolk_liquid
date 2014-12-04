module Yoolk
  module Liquid
    module BusinessHourFilter

      def open_closed(business_hour, format, seperator='-')
        formats = format.split(seperator)
        open    = business_hour.open.strftime(formats[0])
        closed  = business_hour.closed.strftime(formats[1])

        "#{open}#{seperator}#{closed}"
      end
    end
  end
end

Liquid::Template.register_filter Yoolk::Liquid::BusinessHourFilter