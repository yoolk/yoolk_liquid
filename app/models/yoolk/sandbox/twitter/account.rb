module Yoolk
  module Sandbox
    module Twitter
      class Account < Yoolk::Sandbox::Base

        attribute :id,                  String
        attribute :username,            String
        attribute :email,               String
        attribute :published,           Boolean
        attribute :profile_url,         String
      end
    end
  end
end