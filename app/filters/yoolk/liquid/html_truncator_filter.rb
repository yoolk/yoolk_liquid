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
        HTML_Truncator.truncate(html, length, options.with_indifferent_access)
        # html_truncator_without_indifferent_access(html, length, options.with_indifferent_access)
      end
      # alias_method_chain :html_truncator, :indifferent_access
    end
  end
end

Liquid::Template.register_filter Yoolk::Liquid::HTML_TruncatorFilter