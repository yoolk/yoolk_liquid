module Yoolk
  module Liquid
    module InstantWebsite
      class WebsiteDrop < BaseDrop
        attributes  :id, :google_analytics_key, :is_live, :is_active, :free_plan, :template_name,
                    :primary_domain, :created_at, :updated_at

        belongs_to  :favicon,       with: 'Yoolk::Liquid::AttachmentDrop'
        belongs_to  :template,      with: 'Yoolk::Liquid::InstantWebsite::TemplateDrop'

        has_many    :cover_photos,  with: 'Yoolk::Liquid::InstantWebsite::WebsiteCoverPhotoDrop'
        has_many    :domains,       with: 'Yoolk::Liquid::InstantWebsite::DomainDrop'

        def office_url
          office_path
        end

        def cover_photos
          value = website_cover_photos.presence || template_cover_photos
          ::Liquid::Rails::Drop.dropify(value)
        end

        ## during preview mode, website doesn't have template.
        def website_cover_photos
          if template.try(:cover_photo).present?
            object.cover_photos.select do |cover_photo|
              cover_photo.dimension  == template.cover_photo.dimension
            end
          else
            []
          end
        end

        def template_cover_photos
          if @context['request'].preview_mode?
            [@context['current_template'].try(:cover_photo).object].compact
          else
            [template.try(:cover_photo)].compact
          end
        end
      end
    end
  end
end