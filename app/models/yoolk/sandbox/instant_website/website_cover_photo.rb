module Yoolk
  module Sandbox
    class InstantWebsite::WebsiteCoverPhoto < Yoolk::Sandbox::Base

      attribute :id,                    String
      attribute :caption,               String
      attribute :dimension,             String
      attribute :display_order,         Integer
      attribute :created_at,            DateTime
      attribute :updated_at,            DateTime

      attribute :image,                 Yoolk::Sandbox::Attachment
    end
  end
end