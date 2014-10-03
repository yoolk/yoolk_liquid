module Yoolk
  module Liquid
    module Twitter
      class AccountDrop < BaseDrop
        attributes  :id, :username, :email, :link

        def link
          object.profile_url
        end
      end
    end
  end
end