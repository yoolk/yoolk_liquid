module Yoolk
  module Sandbox
    class Listing::Keyphrase < Yoolk::Sandbox::Base

      attribute :id,          String
      attribute :text,        String
      attribute :position,    Integer
      attribute :created_at,  DateTime
      attribute :updated_at,  DateTime
    end
  end
end
