module Yoolk
  module Sandbox
    class Listing::Attachment < Yoolk::Sandbox::Base

      attribute :id,          String
      attribute :name,        String
      attribute :file_size,   Float
      attribute :extension,   String
      attribute :url,         String
      attribute :created_at,  DateTime
      attribute :updated_at,  DateTime
    end
  end
end