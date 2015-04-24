module Yoolk
  module Sandbox
    module InstantWebsite
      class TemplatePage < Yoolk::Sandbox::Base

        attribute :id,               String
        attribute :name,             String
        attribute :display_order,    Integer
        attribute :created_at,       DateTime
        attribute :updated_at,       DateTime

        def menu?
          name == 'Menu'
        end

        def products?
          name == 'Products'
        end

        def services?
          name == 'Services'
        end

        def about_us?
          name == 'About Us'
        end

        def map?
          name == 'Map'
        end
      end
    end
  end
end