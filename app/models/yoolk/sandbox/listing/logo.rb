module Yoolk
  module Sandbox
    class Listing::Logo < Base

      attribute     :id,                String
      attribute     :image,             Yoolk::Sandbox::Attachment
      attribute     :created_at,        DateTime
      attribute     :updated_at,        DateTime

      ## Delegate
      delegate      :styles, :width, :height, :size, :url,
                    to: :image
    end
  end
end