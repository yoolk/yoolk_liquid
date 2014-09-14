module Yoolk
  module Sandbox
    class Listing::CatalogItem < Base

      attribute     :id,                String
      attribute     :title,             String
      attribute     :html_text,         String
      attribute     :show_image,        Boolean
      attribute     :published,         Boolean
      attribute     :display_order,     Integer
      attribute     :created_at,        DateTime
      attribute     :updated_at,        DateTime

      attribute     :image,             Yoolk::Sandbox::Attachment

      ## Delegate
      delegate      :styles, :width, :height, :size, :url,
                    to: :image, allow_nil: true
    end
  end
end