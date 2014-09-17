module Yoolk
  module Liquid
    class Listing::PeopleDrop < ::Liquid::Rails::CollectionDrop
      # scope :emails

      def [](index)
        dropped_collection[index.to_i]
      end

      %w(director manager employee).each do |position_level_method|
        define_method(position_level_method) do
          self.class.new people.select{|person| person.position_level.name.downcase == position_level_method }
        end
      end

      def to_liquid
        self
      end

      def people
        objects
      end
    end
  end
end