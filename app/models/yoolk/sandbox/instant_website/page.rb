module Yoolk
  module Sandbox
    class InstantWebsite::Page < Base

      PRIMARY_PAGES = %w(home products menu services reservation feedback contact_us)

      attribute :id,                    String
      attribute :name,                  String
      attribute :display_order,         Integer
      attribute :created_at,            DateTime
      attribute :updated_at,            DateTime

      attribute :template_page,         Yoolk::Sandbox::InstantWebsite::TemplatePage

      def primary?
        PRIMARY_PAGES.include?(template_page.name.parameterize.underscore)
      end
    end
  end
end