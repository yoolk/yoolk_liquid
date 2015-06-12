module Yoolk
  module Liquid
    module LinkFilter
      def link_to_office(value, options={})
        link_to(value, office_path, options.merge({rel: "nofollow"}))
      end

      def link_to_home(value, options={})
        link_to(value, root_path, default_class_options(root_url?, options))
      end
      alias_method :link_to_root, :link_to_home

      def link_to_galleries(value, options={})
        link_to(value, galleries_path, default_class_options(galleries_url?, options))
      end

      def link_to_people(value, options={})
        link_to(value, people_path, default_class_options(people_url?, options))
      end

      def link_to_products(value, options={})
        link_to(value, products_path, default_class_options(products_url?, options))
      end

      def link_to_services(value, options={})
        link_to(value, services_path, default_class_options(services_url?, options))
      end

      def link_to_menu(value, options={})
        link_to(value, menu_path, default_class_options(menu_url?, options))
      end

      def link_to_announcements(value, options={})
        link_to(value, announcements_path, default_class_options(announcements_url?, options))
      end

      def link_to_brochures(value, options={})
        link_to(value, brochures_path, default_class_options(brochures_url?, options))
      end

      def link_to_links(value, options={})
        link_to(value, links_path, default_class_options(links_url?, options))
      end

      def link_to_videos(value, options={})
        link_to(value, videos_path, default_class_options(videos_url?, options))
      end

      def link_to_attachments(value, options={})
        link_to(value, attachments_path, default_class_options(attachments_url?, options))
      end

      def link_to_map(value, options={})
        link_to(value, map_index_path, default_class_options(map_url?, options))
      end

      def link_to_about_us(value, options={})
        link_to(value, about_us_path, default_class_options(about_us_url?, options))
      end

      def link_to_contact_us(value, options={})
        link_to(value, contact_us_path, default_class_options(contact_us_url?, options))
      end

      def link_to_reservation(value, options={})
        link_to(value, reservation_index_path, default_class_options(reservation_url?, options))
      end

      def link_to_feedback(value, options={})
        link_to(value, feedback_index_path, default_class_options(feedback_url?, options))
      end

      def link_to_sign_in(value)
        link_to value, office_path, rel: 'nofollow'
      end
    end
  end
end

Liquid::Template.register_filter Yoolk::Liquid::LinkFilter