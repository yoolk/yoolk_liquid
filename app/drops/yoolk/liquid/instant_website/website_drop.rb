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
          binding.pry
        end

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
            template = {}
            if request.params[:theme].present?
              path = Rails.root.join('db', 'samples', 'jsons', 'templates/*')

              Dir[path].each do |file|
                return nil unless File.exists? file
                attributes = Oj.load(File.read(file))
                template = attributes if attributes["name"] == request.params[:theme]
              end
            end

            template_sandbox = Yoolk::Sandbox::InstantWebsite::Template.new(template)

            object.template = template_sandbox if template.present?
            [object.template.to_liquid.cover_photo].compact
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