module Yoolk
  module Liquid
    class Listing::AttachmentDrop < BaseDrop
      attributes  :id, :name, :file_size, :extension,
                  :created_at, :updated_at

      def name
        "#{ object.name }.#{ object.extension }"
      end
    end
  end
end