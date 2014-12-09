module Yoolk
  module Liquid
    class Listing::CommunicationDrop < BaseDrop
      attributes :id, :type, :label, :value, :is_first_line, :image_url, :created_at, :updated_at

      def li
        if type.downcase.in?(['branch office', 'department'])
          branch_office
        elsif value.blank?
          h.content_tag :span, label
        elsif object.email?
          email_li
        elsif object.website? || type.downcase.in?(['facebook', 'twitter'])
          website_link(social_network_value, value_with_http)
        else
          list_item
        end
      end

      private

        def list_item(&block)
          content = h.capture(&block) if block_given?

          h.content_tag :li do
            h.concat h.content_tag(:span, label.presence || type)
            if content.present?
              h.concat h.content_tag(:span, h.truncate(value), title: value) { content }
            else
              h.concat h.content_tag(:span, h.truncate(value), title: value)
            end
          end
        end

        def branch_office
          if value.blank?
            h.content_tag :span, label
          else
            list_item
          end
        end

        def email_li
          list_item do
            h.content_tag(:a, value, href: "mailto:#{value}", rel: 'tooltip', title: value) do
              value
            end
          end
        end

        def website_link(value, href)
          list_item do
            h.content_tag(:a, h.truncate(value), href: href, rel: 'tooltip', title: value)
          end
        end

        def social_network_value
          if type.downcase == 'facebook'
            value.gsub(/^.*facebook.com\/(?:pages\/)?([^\/]*)(\/.*)?$/, '\1')
          elsif type.downcase == 'twitter'
            value.gsub(/^.*twitter.com\/([^\/]*)(\/.*)?$/, '\1')
          else
            value
          end
        end

        def value_with_http
          return value if value =~ /^https?:\/\//

          "http://#{value}"
        end

        def h
          @context.registers[:helper]
        end
    end
  end
end