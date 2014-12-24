module Yoolk
  module Liquid
    class Listing::PersonDrop < BaseDrop
      attributes  :id, :title, :first_name, :last_name, :gender,
                  :position_title, :is_active, :sharing_status

      belongs_to  :nationality,     with: 'Yoolk::Liquid::NationalityDrop'
      belongs_to  :position_level,  with: 'Yoolk::Liquid::PositionLevelDrop'
      belongs_to  :photo,           with: 'Yoolk::Liquid::AttachmentDrop'

      has_many    :communications,  with: 'Yoolk::Liquid::Listing::CommunicationDrop'
      has_many    :languages,       with: 'Yoolk::Liquid::LanguageDrop'

      def male?
        gender.to_s.strip.downcase == 'male'
      end

      def female?
        gender.to_s.strip.downcase == 'female'
      end

      def fullname
        "#{ first_name } #{ last_name }"
      end
    end
  end
end