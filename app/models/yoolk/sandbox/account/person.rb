module Yoolk
  module Sandbox
    class Account::Person < Yoolk::Sandbox::Base
      attribute :id,            String
      attribute :full_name,     String
      attribute :gender,        String
      attribute :avatar,        Yoolk::Sandbox::Attachment
    end
  end
end