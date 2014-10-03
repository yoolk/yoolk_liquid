module Yoolk
  module Liquid
    class InstantWebsite::WebsiteDrop < BaseDrop
      attributes  :id, :google_analytics_key, :is_live, :is_active, :free_plan,
                  :created_at, :updated_at

      belongs_to  :favicon,       with: 'Yoolk::Liquid::AttachmentDrop'
      belongs_to  :template,      with: 'Yoolk::Liquid::InstantWebsite::TemplateDrop'

      has_many    :cover_photos,  with: 'Yoolk::Liquid::InstantWebsite::WebsiteCoverPhotoDrop'
      has_many    :domains,       with: 'Yoolk::Liquid::InstantWebsite::DomainDrop'

      def office_url
        '/office'
      end
    end
  end
end