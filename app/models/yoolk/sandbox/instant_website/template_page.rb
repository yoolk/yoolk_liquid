module Yoolk
  module Sandbox
    module InstantWebsite
      class TemplatePage < Yoolk::Sandbox::Base

        attribute :id,               String
        attribute :name,             String
        attribute :display_order,    Integer
        attribute :created_at,       DateTime
        attribute :updated_at,       DateTime


        def self.all
          ['Home', 'Products', 'Services', 'Menu', 'Galleries',
           'About Us', 'Contact Us', 'Reservation', 'Feedback',
           'Announcements', 'Videos', 'Attachments', 'Links',
           'People', 'Map', 'Brochures'
          ]
        end

        self.all.each do |name|
          define_method "#{name.parameterize.underscore}?" do
            self.name == name
          end
        end

      end
    end
  end
end
