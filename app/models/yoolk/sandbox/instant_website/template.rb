module Yoolk
  module Sandbox
    class InstantWebsite::Template < Yoolk::Sandbox::Base

      attribute :id,               String
      attribute :name,             String
      attribute :description,      String
      attribute :is_responsive,    Boolean
      attribute :industries,       Array
      attribute :pages,            Array
      attribute :created_at,       DateTime
      attribute :updated_at,       DateTime

      attribute :thumbnail,        Yoolk::Sandbox::Attachment
      attribute :cover_photo,      Yoolk::Sandbox::InstantWebsite::TemplateCoverPhoto
    end
  end
end