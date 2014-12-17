module Yoolk
  module Liquid
    module Twitter
      class AccountDrop < BaseDrop
        attributes  :id, :username, :email, :profile_url

        def url
          object.profile_url
        end
      end
    end
  end
end