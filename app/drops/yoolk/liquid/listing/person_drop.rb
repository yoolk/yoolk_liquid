module Yoolk
  module Liquid
    class Listing::PersonDrop < BaseDrop
      attributes  :id, :title, :first_name, :last_name, :gender,
                  :position_title, :is_active, :sharing_status

      belongs_to  :nationality,     with: 'Yoolk::Liquid::NationalityDrop'
      belongs_to  :position_level,  with: 'Yoolk::Liquid::PositionLevelDrop'
      belongs_to  :photo,           with: 'Yoolk::Liquid::AttachmentDrop'

      has_many    :communications,  class_name: 'Yoolk::Liquid::Listing::CommunicationsDrop',
                                    with: 'Yoolk::Liquid::Listing::CommunicationDrop'
      has_many    :languages,       with: 'Yoolk::Liquid::LanguageDrop'

      delegate    :male?, :female?, :full_name, to: :object

      def photo
        object.photo || default_photo
      end

      private

        def default_photo
          h = {
            "content_type" => "image/png",
            "attachment_meta" => {
              "medium" => {
                "width" => 206,
                "height" => 239,
                "url" => "yoolk/default-images/people/medium/#{ gender.to_s.downcase }_#{ position_level.name.to_s.downcase }.png"
              },
              "small" => {
                "width" => 139,
                "height" => 161,
                "url" => "yoolk/default-images/people/small/#{ gender.to_s.downcase }_#{ position_level.name.to_s.downcase }.png"
              }
            }
          }
          
          Yoolk::Sandbox::Attachment.new(h).to_liquid
        end

        def view
          @context.registers[:view]
        end
    end
  end
end