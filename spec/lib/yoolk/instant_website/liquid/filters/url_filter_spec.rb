require 'spec_helper'

module Yoolk
  module InstantWebsite
    module Liquid
      describe UrlFilter do
        let(:context) { ::Liquid::Context.new }

        before do
          context['current_theme']   = 'theme_a'
          context.registers[:helper] = ActionController::Base.helpers
        end

        context 'general' do
          it '#asset_path' do
            context.registers[:helper].should_receive(:asset_path).with('theme_a/all.js')
            ::Liquid::Variable.new("'all.js' | asset_path").render(context)
          end

          it '#script_tag' do
            expect(::Liquid::Variable.new("'jquery.js' | script_tag").render(context)).to eq(%|<script src="jquery.js" type="text/javascript"></script>|)
          end

          it '#stylesheet_tag' do
            expect(::Liquid::Variable.new("'bootstrap.css' | stylesheet_tag").render(context)).to eq(%|<link href="bootstrap.css" rel="stylesheet" type="text/css" media="all" />|)
          end

          it '#link_to' do
            expect(::Liquid::Variable.new("'Google' | link_to: 'http://www.google.com.kh', 'google'").render(context)).to eq(%|<a href="http://www.google.com.kh" title="google" class="">Google</a>|)
          end

          it '#image_tag' do
            context['url'] = 'https://www.google.com.kh/images/srpr/logo11w.png'

            expect(::Liquid::Variable.new('url | image_tag').render(context)).to eq(%|<img src="https://www.google.com.kh/images/srpr/logo11w.png" alt="" />|)
          end
        end

        context 'link_to methods' do
          before do
            allow_message_expectations_on_nil
          end

          it '#link_to_office' do
            expect(::Liquid::Variable.new("'Office' | link_to_office").render(context)).to eq(%|<a href="/office" title="Office" class="">Office</a>|)
          end

          it "#link_to_home set 'active' class" do
            context.registers['controller'].stub_chain(:request, :fullpath).and_return('/')

            expect(::Liquid::Variable.new("'Home' | link_to_home").render(context)).to eq(%|<a href="/" title="Home" class="active">Home</a>|)
          end

          it "#link_to_home doesn't set 'active' class" do
            context.registers['controller'].stub_chain(:request, :fullpath).and_return('/else')

            expect(::Liquid::Variable.new("'Home' | link_to_home").render(context)).to eq(%|<a href="/" title="Home" class="">Home</a>|)
          end

          it '#link_to_galleries' do
            context.registers['controller'].stub_chain(:request, :fullpath).and_return('/galleries')

            expect(::Liquid::Variable.new("'Galleries' | link_to_galleries").render(context)).to eq(%|<a href="/galleries" title="Galleries" class="active">Galleries</a>|)
          end

          it '#link_to_people' do
            context.registers['controller'].stub_chain(:request, :fullpath).and_return('/people')

            expect(::Liquid::Variable.new("'People' | link_to_people").render(context)).to eq(%|<a href="/people" title="People" class="active">People</a>|)
          end

          it '#link_to_products' do
            context.registers['controller'].stub_chain(:request, :fullpath).and_return('/products')

            expect(::Liquid::Variable.new("'Products' | link_to_products").render(context)).to eq(%|<a href="/products" title="Products" class="active">Products</a>|)
          end

          it '#link_to_services' do
            context.registers['controller'].stub_chain(:request, :fullpath).and_return('/services')

            expect(::Liquid::Variable.new("'Services' | link_to_services").render(context)).to eq(%|<a href="/services" title="Services" class="active">Services</a>|)
          end

          it '#link_to_foods' do
            context.registers['controller'].stub_chain(:request, :fullpath).and_return('/foods')

            expect(::Liquid::Variable.new("'Foods' | link_to_foods").render(context)).to eq(%|<a href="/foods" title="Foods" class="active">Foods</a>|)
          end

          it '#link_to_announcements' do
            context.registers['controller'].stub_chain(:request, :fullpath).and_return('/announcements')

            expect(::Liquid::Variable.new("'Announcements' | link_to_announcements").render(context)).to eq(%|<a href="/announcements" title="Announcements" class="active">Announcements</a>|)
          end

          it '#link_to_map' do
            context.registers['controller'].stub_chain(:request, :fullpath).and_return('/map')

            expect(::Liquid::Variable.new("'Map' | link_to_map").render(context)).to eq(%|<a href="/map" title="Map" class="active">Map</a>|)
          end
        end
      end
    end
  end
end