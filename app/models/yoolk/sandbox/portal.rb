module Yoolk
  module Sandbox
    class Portal < Yoolk::Sandbox::Base

      attribute :id,                String
      attribute :abbreviation,      String
      attribute :domain_name,       String
      attribute :description,       String
      attribute :official_name,     String
      attribute :keywords,          String
      attribute :time_zone,         String

      attribute :country,           Yoolk::Sandbox::Country
      attribute :language,          Yoolk::Sandbox::Language

      def labs?
        domain_name == 'labs.yoolk.com'
      end
    end
  end
end