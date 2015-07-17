require 'html_truncator'

module Yoolk
  module Liquid
    module HTML_TruncatorFilter

      # HTML Truncator : gem `html_truncator`
      # Source: https://github.com/nono/HTML-Truncator.

      # @param [ Hash ] options
      #
      # default options:
      # ellipsis: '...'
      # length_in_chars: false
      def html_truncator(html, length, options={})
        HTML_Truncator.truncate(html, length, options.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo})
      end
    end
  end
end

Liquid::Template.register_filter Yoolk::Liquid::HTML_TruncatorFilter