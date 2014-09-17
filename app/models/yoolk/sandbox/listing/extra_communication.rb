module Yoolk
  module Sandbox
    class Listing::ExtraCommunication < Base
      attribute :id,            String
      attribute :type,          String
      attribute :label,         String
      attribute :value,         String
      attribute :created_at,    DateTime
      attribute :updated_at,    DateTime
    end
  end
end