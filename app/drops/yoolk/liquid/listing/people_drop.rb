module Yoolk
  module Liquid
    class Listing::PeopleDrop < ::Liquid::Rails::CollectionDrop
      # scope :emails

      def director
        self.class.new people.select{|person| person.position_level.name.downcase == 'director'}
      end

      def people
        objects
      end
    end
  end
end