module Yoolk
  module Liquid
    module TruncateHtmlFilter

      # Truncate html content from the gem `truncate_html`.
      # @param [ Hash ] options
      #
      # default options:
      # length: 100
      # omission: '...'
      # word_boundary: /\S/
      def truncate_html(html, options={})
        return '' if html.nil?

        html_string = TruncateHtml::HtmlString.new(html)
        TruncateHtml::HtmlTruncator.new(html_string, options.with_indifferent_access).truncate.html_safe
      end
    end
  end
end

Liquid::Template.register_filter Yoolk::Liquid::TruncateHtmlFilter