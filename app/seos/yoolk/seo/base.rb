module Yoolk
  module Seo
    class Base
      attr_reader :listing, :object

      def initialize(listing, object)
        @listing = listing
        @object  = object
      end

      def title
        "#{listing_name} - #{category_name } #{I18n.t(:'seo.in')} #{location_name}"
      end

      def description
        if description = listing.listing_categories.first.try(:short_description).try(:text).presence
          "#{category_name}, #{listing.location.try(:name)} #{I18n.t(:'seo.by')} #{listing.name}: #{description.split('•').delete_if(&:blank?).collect(&:strip).join('. ')}"
        else
          "#{listing_name} #{I18n.t(:'seo.is_located_in')} #{location_name} #{I18n.t(:'seo.and_classified_as')} #{category_names}"
        end
      end

      def keywords
        [listing.name, location_name, keyphrase_texts].compact.join(', ')
      end

      def social_image
        listing.logo.present? ? listing.logo.url(:small) : ''
      end

      def social_url
        listing.instant_website.try(:primary_domain).try(:name)
      end

    private

      def listing_name
        listing.name
      end

      def category_name
        listing.listing_categories.first.try(:name)
      end

      def category_names
        listing.categories.map(&:name).join(', ')
      end

      def location_name
        listing.location.try(:name)
      end

      def keyphrase_texts
        listing.keyphrases.map(&:text).join(', ')
      end

      def phone_number
         listing.telephone.try(:value)
      end

      def email_address
        listing.email.try(:value)
      end
    end
  end
end