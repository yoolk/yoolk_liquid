module Yoolk
  module Sandbox
    module InstantWebsite
      class WebsiteCoverPhoto < Yoolk::Sandbox::Base

        attribute :id,                    String
        attribute :caption,               String
        attribute :dimension,             String
        attribute :display_order,         Integer
        attribute :created_at,            DateTime
        attribute :updated_at,            DateTime

        attribute :image,                 Yoolk::Sandbox::Attachment

        def dimension_width
          dimension.split("x").first.to_i
        end

        def dimension_height
          dimension.split("x").last.to_i
        end
      end
    end
  end
end