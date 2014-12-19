module Yoolk
  module Liquid
    module Twitter
      class AccountDrop < BaseDrop
        attributes  :id, :username, :email, :url

        def url
          object.profile_url
        end
      end
    end
  end
end