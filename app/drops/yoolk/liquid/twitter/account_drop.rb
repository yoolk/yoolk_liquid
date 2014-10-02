module Yoolk
  module Liquid
    class Twitter::AccountDrop < BaseDrop
      attributes  :id, :username, :email, :link

      def link
        object.profile_url
      end
    end
  end
end