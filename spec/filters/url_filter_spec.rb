require 'rails_helper'

module Yoolk
  module Liquid
    describe UrlFilter do
      before  { setup_view_and_controller }

      it '#link_to_office' do
        expect_template_result("{{ 'Office' | link_to_office }}", "<a href=\"/office\">Office</a>")
      end

      it '#link_to_home' do
        expect_template_result("{{ 'Home' | link_to_home }}", "<a href=\"/\">Home</a>")
      end

      it '#link_to_galleries' do
        expect_template_result("{{ 'Galleries' | link_to_galleries }}", "<a href=\"/galleries\">Galleries</a>")
      end

      it '#link_to_people' do
        expect_template_result("{{ 'People' | link_to_people }}", "<a href=\"/people\">People</a>")
      end

      it '#link_to_products' do
        expect_template_result("{{ 'Products' | link_to_products }}", "<a href=\"/products\">Products</a>")
      end

      it '#link_to_services' do
        expect_template_result("{{ 'Services' | link_to_services }}", "<a href=\"/services\">Services</a>")
      end

      it '#link_to_menu' do
        expect_template_result("{{ 'Menu' | link_to_menu }}", "<a href=\"/menu\">Menu</a>")
      end

      it '#link_to_announcements' do
        expect_template_result("{{ 'Announcements' | link_to_announcements }}", "<a href=\"/announcements\">Announcements</a>")
      end

      it '#link_to_brochures' do
        expect_template_result("{{ 'Brochures' | link_to_brochures }}", "<a href=\"/brochures\">Brochures</a>")
      end

      it '#link_to_map' do
        expect_template_result("{{ 'Map' | link_to_map }}", "<a href=\"/map\">Map</a>")
      end

      it '#link_to_about_us' do
        expect_template_result("{{ 'About us' | link_to_about_us }}", "<a href=\"/about_us\">About us</a>")
      end

      it '#link_to_contact_us' do
        expect_template_result("{{ 'Contact us' | link_to_contact_us }}", "<a href=\"/contact_us\">Contact us</a>")
      end

      it '#link_to_sign_in' do
        expect_template_result("{{ 'Sign in' | link_to_sign_in }}", "<a href=\"/office\">Sign in</a>")
      end
    end
  end
end