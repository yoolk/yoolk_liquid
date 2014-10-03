module Yoolk
  module Liquid
    class AccountDrop < BaseDrop
      attributes  :id, :first_name, :last_name, :full_name, :gender
      belongs_to  :avatar, class_name: 'Yoolk::Liquid::AttachmentDrop'

      def first_name
        object.person.try(:first_name)
      end

      def last_name
        object.person.try(:last_name)
      end

      def full_name
        object.person.try(:full_name)
      end

      def gender
        object.person.try(:gender)
      end
    end
  end
end