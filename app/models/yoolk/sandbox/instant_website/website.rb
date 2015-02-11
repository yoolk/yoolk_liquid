module Yoolk
  module Sandbox
    module InstantWebsite
      class Website < Yoolk::Sandbox::Base

        attribute :id,                    String
        attribute :google_analytics_key,  String
        attribute :is_live,               Boolean
        attribute :is_active,             Boolean
        attribute :free_plan,             Boolean
        attribute :color_name,            String
        attribute :created_at,            DateTime
        attribute :updated_at,            DateTime

        attribute :favicon,               Yoolk::Sandbox::Attachment
        attribute :template,              Yoolk::Sandbox::InstantWebsite::Template
        attribute :listing,               Yoolk::Sandbox::Listing
        attribute :cover_photos,          Array[Yoolk::Sandbox::InstantWebsite::WebsiteCoverPhoto]
        attribute :domains,               Array[Yoolk::Sandbox::InstantWebsite::Domain]

        delegate  :name,                  to: :template, prefix: true

        def initialize(attributes={})
          super

          domains.each do |domain|
            domain.instant_website = self
          end
        end

        def primary_domain
          domains.find { |domain| domain.is_primary == true }
        end

        def domain_name
          primary_domain.name
        end
      end
    end
  end
end