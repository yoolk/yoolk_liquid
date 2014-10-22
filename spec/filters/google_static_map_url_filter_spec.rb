require 'rails_helper'

module Yoolk
  module Liquid
    describe GoogleStaticMapUrlFilter do
      let(:listing) { double('lat' => '40.714728', 'long' => '-73.998672', 'zoom_level' => 13) }
      let(:drop)    { Yoolk::Liquid::ListingDrop.new(listing) }

      it '#google_static_map_url' do
        expect_template_result("{{ listing | google_static_map_url: size: '300x200' }}", 'https://maps.googleapis.com/maps/api/staticmap?center=40.714728%2C-73.998672&maptype=roadmap&size=300x200&zoom=13&markers=color%3Ared%7C40.714728%2C-73.998672', { 'listing' => drop })
      end
    end
  end
end