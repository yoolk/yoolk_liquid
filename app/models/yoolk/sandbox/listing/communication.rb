module Yoolk
  module Sandbox
    class Listing::Communication < Base
      attribute :id,            String
      attribute :type,          String
      attribute :value,         String
      attribute :is_first_line, Boolean
      attribute :image_url,     String
    end
  end
end