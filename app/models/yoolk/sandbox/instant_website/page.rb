module Yoolk
  module Sandbox
    class InstantWebsite::Page < Base

      attribute :id,                    String
      attribute :name,                  String
      attribute :created_at,            DateTime
      attribute :updated_at,            DateTime

      attribute :template_page,         Yoolk::Sandbox::InstantWebsite::TemplatePage
    end
  end
end