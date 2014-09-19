module Yoolk
  module Sandbox
    class Listing::BusinessPhoto < Yoolk::Sandbox::Base

      attribute :id,            String
      attribute :name,          String
      attribute :embed_script,  String
      attribute :description,   String
      attribute :created_at,    DateTime
      attribute :updated_at,    DateTime
    end
  end
end
