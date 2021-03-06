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

        if request.map_url?              then append_li li( t("Map")         )
        elsif request.about_us_url?      then append_li li( t("About Us")    )
        elsif request.brochures_url?     then append_li li( t("Brochures")   )
        elsif request.people_url?        then append_li li( t("People")      )
        elsif request.reservation_url?   then append_li li( t("Reservation") )
        elsif request.feedback_url?      then append_li li( t("Feedback")    )
        elsif request.contact_us_url?    then append_li li( t("Contact Us")  )
        elsif request.videos_url?        then append_li li( t("Videos")      )
        elsif request.attachments_url?   then append_li li( t("Attachments") )
        elsif request.links_url?         then append_li li( t("Links")       )
        elsif request.galleries_url?
          append_li li_galleries
          append_li li(span gallery.name)     if gallery
        elsif request.announcements_url?
          append_li li_announcements
          append_li li(span view.localize(announcement.updated_at, format: :long))  if announcement
        elsif request.products_url?
          append_li li_products

          if request.products_category_url?
            product_category.self_and_ancestors.each do |p_category|
              append_li li_product_category(p_category)
            end
          end

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
          li view.link_to( t("Home"), request.root_url, itemprop: "item")
        end

        def li_galleries
          li view.link_to_if(gallery, t("Photos"), request.galleries_url, itemprop: "item")
        end

        def li_announcements
          li view.link_to_if(announcement, t("Announcements"), request.announcements_url, itemprop: "item")
        end

        def li_products
          li view.link_to_if(product || product_category, t("Products"), request.products_url, itemprop: "item")
        end

        def li_product_category(p_category)
          li view.link_to_unless(p_category.id.eql?(product_category.id.to_i) && product.nil?, span(p_category.try(:name)), request.product_category_products_url(p_category), itemprop: "item")
        end

        def li_services
          li view.link_to_if(service || service_category, t("Services"), request.services_url, itemprop: "item")
        end

        def li_service_category
          li view.link_to_if(service, span(service_category.name), request.services_category_url(service_category), itemprop: "item")
        end

        def li_menu
          li view.link_to_if(food || food_category, t("Menu"), request.menu_url, itemprop: "item")
        end

        def li_food_category
          li view.link_to_if(food, span(food_category.name), request.menu_category_foods_url(food_category), itemprop: "item") if food_category
        end

        def li(content)
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
          @context['product_category']
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
          @context['food_category']
        end

        def announcement
          @context['announcement']
        end

        def request
          @context['request']
        end

        def controller
          @context.registers[:controller]
        end

        def t(page_name)
          view.content_tag :span, custom(page_name) || translate(page_name), itemprop: 'name'
        end

        private

        def custom(page_name)
          _page = @context['listing.instant_website.pages'].find_by(page_name)
          _page.name if _page && _page.custom_name?
        end

        def translate(page_name)
          key        = page_name.to_s.parameterize.underscore
          value      = I18n.t(:"#{request.theme_name}.breadcrumb.#{key}", default: :"breadcrumb.#{key}")
        end

        def view
          @context.registers[:view]
        end
    end
  end
end

Liquid::Template.register_tag('breadcrumb', Yoolk::Liquid::BreadcrumbTag)
