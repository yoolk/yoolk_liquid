module Yoolk
  module Sandbox
    class InstantWebsite::Website < Yoolk::Sandbox::Base

      attribute :id,                    String
      attribute :google_analytics_key,  String
      attribute :is_live,               Boolean
      attribute :is_active,             Boolean
      attribute :free_plan,             Boolean

      attribute :favicon,               Yoolk::Sandbox::Attachment
      attribute :template,              Yoolk::Sandbox::InstantWebsite::Template
      attribute :cover_photos,          Array[Yoolk::Sandbox::InstantWebsite::WebsiteCoverPhoto]
      attribute :domains,               Array[Yoolk::Sandbox::InstantWebsite::Domain]
    end
  end
end
