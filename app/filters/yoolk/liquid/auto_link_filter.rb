module Yoolk
  module Liquid
    module AutoLinkFilter

      # Truncate html content from the gem `rails_autolink`.
      # @param [ Hash ] options
      #
      # default options:
      # link: 'all'(default), 'urls', 'email_addresses'
      def auto_link(text, link='all')
        options = {
          link:     link,
          sanitize: true
        }

        @context.registers[:view].auto_link(text, options)
      end
    end
  end
end

Liquid::Template.register_filter Yoolk::Liquid::AutoLinkFilter