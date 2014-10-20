module Yoolk
  module Liquid
    module GoogleStaticImageTagFilter

      def google_static_image_tag(listing, options={})
        lat        = listing.lat
        long       = listing.long
        zoom_level = listing.zoom_level
        width      = options["width"]  || 222
        height     = options["height"] || 222

        render_map(lat, long, zoom_level, width, height, options)
      end

      def render_map(lat, long, zoom_level, width, height, options={})
        options[:alt] ||= "google map"

        map_options = {
          center:   "#{lat},#{long}",
          zoom:     zoom_level,
          size:     "#{width}x#{height}",
          maptype:  "roadmap",
          sensor:   false,
          markers:  "color:red%7C#{lat},#{long}"
        }
        map_url = "http://maps.googleapis.com/maps/api/staticmap"

        image_tag "#{map_url}?#{CGI.unescape(map_options.to_query)}", options
      end

    end
  end
end

Liquid::Template.register_filter Yoolk::Liquid::GoogleStaticImageTagFilter