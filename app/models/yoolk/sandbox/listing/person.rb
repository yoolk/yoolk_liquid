module Yoolk
  module Sandbox
    class Listing::Person < Yoolk::Sandbox::Base

      attribute   :title,           String
      attribute   :first_name,      String
      attribute   :last_name,       String
      attribute   :gender,          String
      attribute   :position_title,  String
      attribute   :is_active,       Boolean,  default: true
      attribute   :sharing_status,  String,   default: 'Private'

      attribute   :nationality,     Yoolk::Sandbox::Nationality
      attribute   :position_level,  Yoolk::Sandbox::PositionLevel
      attribute   :photo,           Yoolk::Sandbox::Attachment
      attribute   :communications,  Array[Yoolk::Sandbox::Listing::Communication]
      attribute   :languages,       Array[Yoolk::Sandbox::Language]

      def full_name
        "#{first_name} #{last_name}".strip
      end

      def male?
        gender.to_s.downcase == 'male'
      end

      def female?
        gender.to_s.downcase == 'female'
      end
    end
  end
end