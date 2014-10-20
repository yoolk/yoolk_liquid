module Yoolk
  module Sandbox
    class Hour < Yoolk::Sandbox::Base

      attribute :id,          String
      attribute :hour,        String
      attribute :minute,      String
      attribute :created_at,  DateTime
      attribute :updated_at,  DateTime
    end
  end
end