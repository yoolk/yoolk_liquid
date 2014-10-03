module Yoolk
  module Sandbox
    module Facebook
      class Page < Yoolk::Sandbox::Base

        attribute :id,                       String
        attribute :page_id,                  String
        attribute :page_url,                 String
        attribute :page_name,                String
        attribute :page_access_token,        String
        attribute :cover_photo_url,          String
        attribute :installed_page_ids,       Array
        attribute :photo_uploaded_status,    String
        attribute :is_published,             Boolean
        attribute :last_photo_uploaded_at,   DateTime

      end
    end
  end
end