module Yoolk
  module Sandbox
    class Listing::Artwork < Base

      attribute     :id,                String
      attribute     :name,              String
      attribute     :text,              String
      attribute     :description,       String
      attribute     :is_active,         Boolean
      attribute     :created_at,        DateTime
      attribute     :updated_at,        DateTime

      attribute     :image,             Yoolk::Sandbox::Attachment

      ## Delegate
      delegate      :styles, :width, :height, :size, :url,
                    to: :image, allow_nil: true
    end
  end
end