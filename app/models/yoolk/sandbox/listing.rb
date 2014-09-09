module Yoolk
  module Sandbox
    class Listing < Base

      attribute :id,                      String
      attribute :alias_id,                String
      attribute :name,                    String
      attribute :address,                 String
      attribute :lat,                     Float
      attribute :long,                    Float
      attribute :zoom_level,              Integer
      attribute :is_active,               Boolean
      attribute :created_at,              DateTime
      attribute :updated_at,              DateTime

      # relations
      attribute :location,                Yoolk::Sandbox::Location
      attribute :country,                 Yoolk::Sandbox::Country
      attribute :communications,          Array[Yoolk::Sandbox::Listing::Communication]
      attribute :extra_communications,    Array[Yoolk::Sandbox::Listing::ExtraCommunication]

      def self.find(alias_id)
        path       = Rails.root.join('db', 'samples', 'jsons', "#{alias_id}.json")
        attributes = Oj.load(File.read(path))

        new(attributes)
      end

      def telephone
        communications[0]
      end

      def email
        communications[-1]
      end
    end
  end
end