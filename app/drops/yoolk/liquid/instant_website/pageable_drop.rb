module Yoolk
  module Liquid
    module InstantWebsite
      class PageableDrop < ::Yoolk::Liquid::BaseDrop

        # All Pages
        # ["Products", "Services", "Menu", "Galleries", "About Us", "Contact Us", "Reservation", "Feedback", "Announcements", "Videos", "Attachments", "Links", "People", "Map"]
        PRIMARY_PAGES = %w(products menu services reservation feedback contact_us)

      end
    end
  end
end