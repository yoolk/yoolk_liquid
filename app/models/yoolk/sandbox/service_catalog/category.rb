module Yoolk
  module Sandbox
    module ServiceCatalog
      class Category < Yoolk::Sandbox::Base

        attribute :id,                    String
        attribute :alias_id,              String
        attribute :name,                  String
        attribute :short_name,            String
        attribute :keyword,               String
        attribute :description,           String
        attribute :display_on_web,        Boolean
        attribute :listings_count,        Integer
        attribute :sub_categories_count,  Integer
        attribute :level,                 Integer
        attribute :created_at,            DateTime
        attribute :updated_at,            DateTime

        attribute :services,              Array[Yoolk::Sandbox::ServiceCatalog::Service]

        def to_param
          "#{alias_id}-#{name.parameterize}"
        end

      end
    end
  end
end