module Yoolk
  module Sandbox
    class Listing::Announcement < Yoolk::Sandbox::Base

      attribute :id,          Integer
      attribute :text,        String
      attribute :created_at,  DateTime
      attribute :updated_at,  DateTime

      attribute :image,       Yoolk::Sandbox::Attachment

      def to_param
        id.to_s
      end
    end
  end
end
