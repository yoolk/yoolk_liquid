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

          # website_cover_photos.presence || template_cover_photos
          template_cover_photos
        end
        private

          def website_cover_photos
            if template.try(:cover_photo).present?
              object.cover_photos.select do |cover|
                (cover.to_liquid.dimension_width == template.cover_photo.width) && \
                (cover.to_liquid.dimension_height == template.cover_photo.height)
              end
            else
              []
            end
          end

          def template_cover_photos
            if true#h.preview_mode?
              binding.pry
              template = if request.params[:theme].present?
                Mongoid.raise_not_found_error = false
                Yoolk::Mongo::InstantWebsite::Template.find_by(name: h.params[:theme])
              end
              iw = h.current_listing.instant_website.send(:clone)
              iw.template = template if template.present?
              [iw.template.cover_photo].compact
            elsif template.present?
              [template.cover_photo].compact
            else
              []
            end
          end

          def current_host
            request.host.to_s.gsub(/^www\./, '')
          end
      end
    end
  end
end