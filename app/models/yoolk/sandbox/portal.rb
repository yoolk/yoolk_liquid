module Yoolk
  module Sandbox
    class Portal < Yoolk::Sandbox::Base

      attribute :abbreviation,      String
      attribute :domain_name,       String
      attribute :description,       String
      attribute :official_name,     String
      attribute :analytics_key,     String
      attribute :google_ad_channel, String
      attribute :google_ad_client,  String
      attribute :is_active,         Boolean
      attribute :is_client,         Boolean
      attribute :is_vertical,       Boolean
      attribute :keywords,          String
      attribute :theme_color,       String
      attribute :time_zone,         String
      attribute :categories_count,  Integer
      attribute :listings_count,    Integer
      attribute :zoom_level,        Integer
      attribute :about_us_url,      String
      attribute :android_app_url,   String
      attribute :iphone_app_url,    String

      attribute :categories,        Array[Yoolk::Sandbox::Category]
      attribute :locations,         Array[Yoolk::Sandbox::Location]
      attribute :listings,          Array[Yoolk::Sandbox::Listing]
      attribute :streets,           Array[Yoolk::Sandbox::Location::Street]
      attribute :channels,          Array[Yoolk::Sandbox::Portal::Channel]

      attribute :country,           Yoolk::Sandbox::Country
      attribute :currency,          Yoolk::Sandbox::Currency
      attribute :language,          Yoolk::Sandbox::Language

      attribute :instant_website_asset_settings, \
                                    Array[Yoolk::Sandbox::InstantWebsite::AssetSetting]
    end
  end
end