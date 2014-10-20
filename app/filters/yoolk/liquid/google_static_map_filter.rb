module Yoolk
  module Liquid
    module GoogleStaticMapFilter

      def google_static_map(listing, options={})
        lat        = listing.lat
        long       = listing.long
        zoom_level = listing.zoom_level
        width      = options["width"]  || 222
        height     = options["height"] || 222

        render_map(lat, long, zoom_level, width, height)
      end

      def render_map(lat, long, zoom_level, width, height)

        map_options = {
          center:   "#{lat},#{long}",
          zoom:     zoom_level,
          size:     "#{width}x#{height}",
          maptype:  "roadmap",
          sensor:   false,
          markers:  "color:red%7C#{lat},#{long}"
        }
        map_url = "http://maps.googleapis.com/maps/api/staticmap"

        static_image_url = "#{map_url}?#{CGI.unescape(map_options.to_query)}"
      end

    end
  end
end

Liquid::Template.register_filter Yoolk::Liquid::GoogleStaticMapFilter