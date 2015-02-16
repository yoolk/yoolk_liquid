module Yoolk
  module Liquid
    module TruncateHtmlFilter
      include ::TruncateHtmlHelper

      # Truncate html content from the gem `truncate_html`.
      # @param [ Hash ] options
      #
      # default options:
      # length: 100
      # omission: '...'
      # word_boundary: /\S/
      def truncate_html_with_indifferent_access(html, options={})
        return '' if html.nil?

        html_string = TruncateHtml::HtmlString.new(html)
        TruncateHtml::HtmlTruncator.new(html_string, options.with_indifferent_access).truncate.html_safe
      end
      alias_method_chain :truncate_html, :indifferent_access
    end
  end
end

Liquid::Template.register_filter Yoolk::Liquid::TruncateHtmlFilter