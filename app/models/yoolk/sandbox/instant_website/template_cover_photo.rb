module Yoolk
  module Sandbox
    class InstantWebsite::TemplateCoverPhoto < Yoolk::Sandbox::Base

      attribute :id,                    String
      attribute :dimension,             String
      attribute :created_at,            DateTime
      attribute :updated_at,            DateTime

      attribute :image,                 Yoolk::Sandbox::Attachment
    end
  end
end