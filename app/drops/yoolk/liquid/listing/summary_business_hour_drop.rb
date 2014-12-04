module Yoolk
  module Liquid
    class Listing::SummaryBusinessHourDrop < BaseDrop
      def initialize(days, open, closed)
        @attributes = {
          'days'   => days,
          'open'   => open,
          'closed' => closed
        }
      end

      def day_name
        to_day_names(:'date.day_names')
      end

      def abbr_day_name
        to_day_names(:'date.abbr_day_names')
      end

      def days
        @attributes['days']
      end

      def day_names
        @attributes['days'].map { |day| I18n.t(:'date.day_names')[day.to_i] }
      end

      def abbr_day_names
        @attributes['days'].map { |day| I18n.t(:'date.abbr_day_names')[day.to_i] }
      end

      def open
        @attributes['open']
      end

      def closed
        @attributes['closed']
      end

      private

        # It is grouped by consecqutive numbers.
        # [1,2,3,5] -> '1-3,5'
        # [1,2,3,4] -> '1-4'
        def _grouped_days
          prev = days[0]
          days.slice_before { |e|
            prev, prev2 = e, prev
            prev2 + 1 != e
          }.map { |es|
            es.length <= 2 ? es.join(',') : "#{es.first}-#{es.last}"
          }.join(',')
        end

        def to_day_names(key)
          _grouped_days.split(',').map do |item|
            if item.include?('-')
              item.split('-').map { |day| I18n.t(key)[day.to_i] }.join('-')
            else
              I18n.t(key)[item.to_i]
            end
          end.join(',')
        end
    end
  end
end