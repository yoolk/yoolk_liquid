require 'time'
require 'json'

module Yoolk
  module InstantWebsite
    module Liquid
      module MiscFilter

        # Get the nth element of the passed in array
        def index(array, position)
          array.at(position) if array.respond_to?(:at)
        end

        def default(input, value)
          input.blank? ? value : input
        end

        def random(input)
          rand(input.to_i)
        end

        def date(input, format)
          Time.parse(input).strftime(format)
        end

        def json(object)
          JSON.dump(object)
        end
      end
    end
  end
end

Liquid::Template.register_filter Yoolk::InstantWebsite::Liquid::MiscFilter