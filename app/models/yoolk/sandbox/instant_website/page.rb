module Yoolk
  module Sandbox
    class InstantWebsite::Page < Base

      IMPORTANT_PAGES = %w(home products menu services reservation feedback contact_us)

      attribute :id,                    String
      attribute :name,                  String
      attribute :display_order,         Integer
      attribute :meta_title,            String,  default: nil
      attribute :meta_description,      String,  default: nil
      attribute :meta_keyword,          String,  default: nil
      attribute :created_at,            DateTime
      attribute :updated_at,            DateTime

      attribute :template_page,         Yoolk::Sandbox::InstantWebsite::TemplatePage

      def important?
        IMPORTANT_PAGES.include?(template_page.name.parameterize.underscore)
      end
    end
  end
end