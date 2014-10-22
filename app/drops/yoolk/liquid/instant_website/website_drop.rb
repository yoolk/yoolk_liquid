module Yoolk
  module Liquid
    module InstantWebsite
      class WebsiteDrop < BaseDrop
        attributes  :id, :google_analytics_key, :is_live, :is_active, :free_plan, :template_name,
                    :created_at, :updated_at

        belongs_to  :favicon,       with: 'Yoolk::Liquid::AttachmentDrop'
        belongs_to  :template,      with: 'Yoolk::Liquid::InstantWebsite::TemplateDrop'

        has_many    :cover_photos,  with: 'Yoolk::Liquid::InstantWebsite::WebsiteCoverPhotoDrop'
        has_many    :domains,       with: 'Yoolk::Liquid::InstantWebsite::DomainDrop'

        def template_name
          template.name
        end

        def office_url
          office_path
        end

        def cover_photos
          object.cover_photos.presence || [object.template.cover_photo] 
        end

      end
    end
  end
end