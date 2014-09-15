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
    end
  end
end