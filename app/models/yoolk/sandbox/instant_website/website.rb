module Yoolk
  module Sandbox
    module InstantWebsite
      class Website < Yoolk::Sandbox::Base

        attribute :id,                    String
        attribute :google_analytics_key,  String
        attribute :is_live,               Boolean
        attribute :is_active,             Boolean
        attribute :free_plan,             Boolean
        attribute :created_at,            DateTime
        attribute :updated_at,            DateTime

        attribute :favicon,               Yoolk::Sandbox::Attachment
        attribute :template,              Yoolk::Sandbox::InstantWebsite::Template
        attribute :cover_photos,          Array[Yoolk::Sandbox::InstantWebsite::WebsiteCoverPhoto]
        attribute :domains,               Array[Yoolk::Sandbox::InstantWebsite::Domain]

        def primary_domain
          domains.find{ |domain| domain.is_primary == true }
        end
      end
    end
  end
end