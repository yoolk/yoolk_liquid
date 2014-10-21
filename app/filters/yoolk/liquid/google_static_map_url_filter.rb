module Yoolk
  module Liquid
    module GoogleStaticMapUrlFilter
      include ::Liquid::Rails::GoogleStaticMapUrlFilter

      def google_static_map_url_with_listing(listing, options={})
        center  = "#{listing.lat},#{listing.long}"
        size    = options.delete('size')

        options = options.reverse_merge({
          'maptype' => 'roadmap',
          'center'  => center,
          'zoom'    => listing.zoom_level,
          'markers' => ["color:red|#{center}"]
        })
        google_static_map_url_without_listing(size, options)
      end
      alias_method_chain :google_static_map_url, :listing
    end
  end
end

Liquid::Template.register_filter Yoolk::Liquid::GoogleStaticMapUrlFilter