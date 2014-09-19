module Yoolk
  module Sandbox
    class InstantWebsite::TemplateCoverPhoto < Yoolk::Sandbox::Base

      attribute :dimension,             String
      attribute :image,                 Yoolk::Sandbox::Attachment
    end
  end
end