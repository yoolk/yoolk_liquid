module Yoolk
  module Liquid
    module InstantWebsite
      class TemplatePageDrop < BaseDrop
        attributes  :id, :name, :display_order, :created_at, :updated_at

        delegate :menu?, :products?, :services?, :about_us?, :map?,
               to: :object
      end
    end
  end
end