module Yoolk
  module Form
    class Feedback
      include Virtus.model
      include ActiveModel::Conversion
      include ActiveModel::Validations
      extend  ActiveModel::Naming

      EMAIL_REG = /[a-zA-Z0-9._%-]+@(?:[a-zA-Z0-9-]+\.)+(com|net|org|info|biz|me|edu|gov)/i

      attribute           :name,      String
      attribute           :sender,    String
      attribute           :body,      String

      validates           :sender, :body,
                          presence: { message: I18n.t(:'yoolk.form.messages.invalid') }
      validates_format_of :sender,
                          with: EMAIL_REG, message: I18n.t(:'yoolk.form.messages.invalid_email'),
                          allow_blank: true

      def to_liquid
        self
      end
    end
  end
end