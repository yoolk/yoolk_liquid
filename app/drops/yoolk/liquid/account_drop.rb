module Yoolk
  module Liquid
    class AccountDrop < BaseDrop
      attributes  :id, :full_name, :gender, :avatar_url

      def full_name
        @object.person.full_name
      end

      def gender
        @object.person.gender
      end

      def avatar_url
        return {} unless @object.person.avatar.present?
        @object.person.avatar.url(:small)
      end
    end
  end
end