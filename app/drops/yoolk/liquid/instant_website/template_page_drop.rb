module Yoolk
  module Liquid
    module InstantWebsite
      class TemplatePageDrop < BaseDrop
        attributes  :id, :name, :display_order, :created_at, :updated_at

        delegate :home?, :products?, :services?, :menu?, :galleries?,
                 :about_us?, :contact_us?, :reservation?, :feedback?,
                 :announcements?, :videos?, :attachments?, :links?,
                 :people?, :map?, :brochures?,
                 to: :object
      end
    end
  end
end
