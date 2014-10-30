module Yoolk
  module Liquid
    module InstantWebsite
      class WebsiteDrop < BaseDrop
        attributes  :id, :google_analytics_key, :is_live, :is_active, :free_plan, :template_name,
                    :primary_domain, :created_at, :updated_at

        belongs_to  :favicon,       with: 'Yoolk::Liquid::AttachmentDrop'
        belongs_to  :template,      with: 'Yoolk::Liquid::InstantWebsite::TemplateDrop'

        has_many    :domains,       with: 'Yoolk::Liquid::InstantWebsite::DomainDrop'

        def office_url
          office_path
        end

        def cover_photos
          value = if template.cover_photo.present?
            object.cover_photos.select do |cover_photo|
              cover_photo.dimension  == template.cover_photo.dimension
            end
          else
            []
          end

          ::Liquid::Rails::Drop.dropify(value)
        end

      end
    end
  end
end