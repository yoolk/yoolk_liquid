module Yoolk
  module Sandbox
    class InstantWebsite::AssetSetting < Yoolk::Sandbox::Base

      attribute :id,            String
      attribute :name,          String
      attribute :duration,      Integer
      attribute :date_unit,     String
      attribute :price,         Float
      attribute :description,   String

      attribute :template_type, Yoolk::Sandbox::InstantWebsite::TemplateType
      attribute :asset_type,    Yoolk::Sandbox::InstantWebsite::AssetType
    end
  end
end