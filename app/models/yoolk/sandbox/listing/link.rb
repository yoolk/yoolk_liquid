module Yoolk
  module Sandbox
    class Listing::Link < Yoolk::Sandbox::Base

      attribute :id,          Integer
      attribute :title,       String
      attribute :link,        String
      attribute :description, String
      attribute :created_at,  DateTime
      attribute :updated_at,  DateTime

      def to_param
        "#{id}-#{title.parameterize}"
      end
    end
  end
end