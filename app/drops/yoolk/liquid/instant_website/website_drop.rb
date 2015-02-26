module Yoolk
  module Liquid
    module InstantWebsite
      class WebsiteDrop < BaseDrop
        attributes  :id, :google_analytics_key, :is_live, :is_active, :free_plan,
                    :template_name, :color,
                    :primary_domain, :created_at, :updated_at

        belongs_to  :favicon,       with: 'Yoolk::Liquid::AttachmentDrop'
        belongs_to  :template,      with: 'Yoolk::Liquid::InstantWebsite::TemplateDrop'

        has_many    :custom_pages,  with: 'Yoolk::Liquid::InstantWebsite::CustomPage'
        has_many    :domains,       with: 'Yoolk::Liquid::InstantWebsite::DomainDrop'

        def color
          object.color_name
        end

        def office_url
          office_path
        end

        ## Returns cover_photos that match the template cover photos
        ## In preview mode, it compares with previewed_template.
        ## In normal mode, it compares with its template.
        def cover_photos
          _cover_photos = if _template.cover_photo.present?
            object.cover_photos.select do |cover|
              cover.dimension == _template.cover_photo.dimension
            end
          else
            []
          end

          ::Liquid::Rails::Drop.dropify(_cover_photos)
        end

        def _template
          @context['request.previewed_template'] || template
        end
      end
    end
  end
end