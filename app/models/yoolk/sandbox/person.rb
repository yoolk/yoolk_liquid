module Yoolk
  module Sandbox
    class Person < Yoolk::Sandbox::Base
      attribute :id,            String
      attribute :first_name,    String
      attribute :last_name,     String
      attribute :full_name,     String
      attribute :gender,        String
      attribute :avatar,        Yoolk::Sandbox::Attachment
    end
  end
end