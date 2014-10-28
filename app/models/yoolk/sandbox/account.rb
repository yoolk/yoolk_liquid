module Yoolk
  module Sandbox
    class Account < Yoolk::Sandbox::Base
      attribute :id,        Integer
      attribute :person,    Yoolk::Sandbox::Person

      ## Delegate
      delegate   :avatar,   to: :person,
                            allow_nil: true
    end
  end
end