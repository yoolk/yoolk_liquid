# Thai unicode is not working properly (listing: th-th229574)
# https://github.com/hgmnz/truncate_html/issues/35

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
        truncate_html_without_indifferent_access(html, options.with_indifferent_access)
      end
      alias_method_chain :truncate_html, :indifferent_access
    end
  end
end

Liquid::Template.register_filter Yoolk::Liquid::TruncateHtmlFilter