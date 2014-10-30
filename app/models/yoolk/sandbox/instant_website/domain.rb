module Yoolk
  module Sandbox
    module InstantWebsite
      class Domain < Yoolk::Sandbox::Base

        attribute :id,                    String
        attribute :name,                  String
        attribute :type,                  String
        attribute :google_analytics_key,  String
        attribute :is_primary,            Boolean
        attribute :listing_alias_id,      String
        attribute :instant_website,       Yoolk::Sandbox::InstantWebsite::Website
        attribute :created_at,            DateTime
        attribute :updated_at,            DateTime

        def listing
          @listing ||= if listing_alias_id.present?
            Yoolk::Sandbox::Listing.find(listing_alias_id)
          else
            instant_website.listing
          end
        end

        def url
          "http://#{name}"
        end
      end
    end
  end
end