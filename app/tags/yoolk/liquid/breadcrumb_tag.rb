module Yoolk
  module Liquid
    class BreadcrumbTag < ::Liquid::Tag
      Syntax = /(#{::Liquid::QuotedString})/

      def initialize(tag_name, markup, options)
        super

        @position_index ||= 0
        @lis = []
        if markup.present?
          @class_name   = $1.gsub(/\"|\'/, '') if markup =~ Syntax
        end
      end

      def render(context)
        @context = context
        @lis    << li_home

        if request.map_url?              then append_li li(t(:map))
        elsif request.about_us_url?      then append_li li(t(:about_us))
        elsif request.brochures_url?     then append_li li(t(:brochures))
        elsif request.people_url?        then append_li li(t(:people))
        elsif request.reservation_url?   then append_li li(t(:reservation))
        elsif request.feedback_url?      then append_li li(t(:feedback))
        elsif request.contact_us_url?    then append_li li(t(:contact_us))
        elsif request.videos_url?        then append_li li(t(:videos))
        elsif request.attachments_url?   then append_li li(t(:attachments))
        elsif request.links_url?
          append_li li_links
          append_li li(span link.title)     if link
        elsif request.galleries_url?
          append_li li_galleries
          append_li li(span gallery.name)     if gallery
        elsif request.announcements_url?
          append_li li_announcements
          append_li li(span view.localize(announcement.updated_at, format: :long))  if announcement
        elsif request.products_url?
          append_li li_products
          append_li li_product_category  if product_category || product
          append_li li(span product.name)     if product
        elsif request.services_url?
          append_li li_services
          append_li li_service_category  if service_category || service
          append_li li(span service.name)     if service
        elsif request.menu_url?
          append_li li_menu
          append_li li_food_category     if food_category || food
          append_li li(span food.name)        if food
        end

        # http://www.danshort.com/HTMLentities/
        <<-EOF.gsub(/^\s+|$\n/, "")
          <ol class="#{ @class_name || 'breadcrumb' }" itemscope itemtype="http://schema.org/BreadcrumbList">
          #{@lis.join}
          </ol>
        EOF
      end

      private

        def span(content)
          view.content_tag(:span, content, itemprop: "name")
        end

        def li_home
          # li view.link_to(t(:home), request.root_url)
          li view.link_to(t(:home), request.root_url, itemprop: "item")
        end

        def li_links
          li view.link_to_if(link, t(:links), request.links_url, itemprop: "item")
        end

        def li_galleries
          li view.link_to_if(gallery, t(:galleries), request.galleries_url, itemprop: "item")
        end

        def li_announcements
          li view.link_to_if(announcement, t(:announcements), request.announcements_url, itemprop: "item")
        end

        def li_products
          li view.link_to_if(product || product_category, t(:products), request.products_url, itemprop: "item")
        end

        def li_product_category
          li view.link_to_if(product, span(product_category.name), request.products_category_url(product_category), itemprop: "item")
        end

        def li_services
          li view.link_to_if(service || service_category, t(:services), request.services_url, itemprop: "item")
        end

        def li_service_category
          li view.link_to_if(service, span(service_category.name), request.services_category_url(service_category), itemprop: "item")
        end

        def li_menu
          li view.link_to_if(food || food_category, t(:menu), request.menu_url, itemprop: "item")
        end

        def li_food_category
          li view.link_to_if(food, span(food_category.name), request.menu_category_url(food_category), itemprop: "item")
        end

        def li(content)
          # view.content_tag :li do
          #   content
          # end
          view.content_tag :li, itemscope: "", itemprop: "itemListElement", itemtype: "http://schema.org/ListItem" do
            content + meta_position
          end
        end

        def meta_position
          view.content_tag :meta, nil, itemprop: "position", content: "#{ @position_index += 1 }"
        end

        def append_li(li)
          @lis << li
        end

        def gallery
          @context['gallery']
        end

        def link
          @context['link']
        end

        def product
          @context['product']
        end

        def product_category
          @product_category ||= product ? product.category : @context['product_category']
        end

        def service
          @context['service']
        end

        def service_category
          @service_category ||= service ? service.category : @context['service_category']
        end

        def food
          @context['food']
        end

        def food_category
          @food_category ||= food ? food.category : @context['food_category']
        end

        def announcement
          @context['announcement']
        end

        def request
          @context['request']
        end

        def t(key)
          text = I18n.t("#{request.theme_name}.breadcrumb.#{key}", default: I18n.t("breadcrumb.#{key}"))
          view.content_tag :span, text, itemprop: "name"
        end

        def view
          @context.registers[:view]
        end
    end
  end
end

Liquid::Template.register_tag('breadcrumb', Yoolk::Liquid::BreadcrumbTag)