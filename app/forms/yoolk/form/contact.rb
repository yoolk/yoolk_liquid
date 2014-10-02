module Yoolk
  module Form
    class Contact
      include Virtus.model
      include ::ActiveModel::Conversion
      include ::ActiveModel::Validations
      extend  ::ActiveModel::Naming

      EMAIL_REG = /([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

      attribute           :name,      String
      attribute           :phone,     String
      attribute           :sender,    String
      attribute           :body,      String

      validates           :sender, :body,
                          presence: { message: "You can't leave this empty" }
      validates_format_of :sender,
                          with: EMAIL_REG, message: 'Email is invalid',
                          allow_blank: true

      def to_liquid
        self
      end
    end
  end
end