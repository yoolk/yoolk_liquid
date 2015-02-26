module Yoolk
  module Sandbox
    module InstantWebsite
      class Template < Yoolk::Sandbox::Base

        attribute :id,               String
        attribute :name,             String
        attribute :display_name,     String
        attribute :developed_by,     String
        attribute :demo_website,     String
        attribute :developer_url,    String
        attribute :description,      String
        attribute :is_responsive,    Boolean
        attribute :industries,       Array
        attribute :colors,           Array
        attribute :created_at,       DateTime
        attribute :updated_at,       DateTime

        attribute :thumbnail,        Yoolk::Sandbox::Attachment
        attribute :cover_photo,      Yoolk::Sandbox::InstantWebsite::TemplateCoverPhoto
        attribute :pages,            Array[Yoolk::Sandbox::InstantWebsite::TemplatePage]
      end
    end
  end
end