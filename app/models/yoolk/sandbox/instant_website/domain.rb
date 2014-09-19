module Yoolk
  module Sandbox
    module InstantWebsite
      class Domain < Yoolk::Sandbox::Base

        attribute :id,                    String
        attribute :name,                  String
        attribute :type,                  String
        attribute :google_analytics_key,  String
        attribute :is_primary,            Boolean
        attribute :created_at,            DateTime
        attribute :updated_at,            DateTime
      end
    end
  end
end