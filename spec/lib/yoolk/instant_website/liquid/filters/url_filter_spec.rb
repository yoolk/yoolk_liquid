require 'spec_helper'

module Yoolk
  module InstantWebsite
    module Liquid
      describe UrlFilter do
        before do
          @context = ::Liquid::Context.new
          @context['current_theme']    = 'theme_a'
          @context.registers['helper'] = ActionController::Base.helpers
          @context.add_filters(UrlFilter)
        end

        it '#theme_asset_path' do
          @context['url'] = 'all.js'

          @context.registers['helper'].should_receive(:asset_path).with('theme_a/all.js')
          ::Liquid::Variable.new('url | theme_asset_path').render(@context)
        end

        it '#script_tag' do
          @context['url'] = 'jquery.js'

          expect(::Liquid::Variable.new('url | script_tag').render(@context)).to eq(%|<script src="jquery.js" type="text/javascript"></script>|)
        end

        it '#stylesheet_tag' do
          @context['url'] = 'bootstrap.css'

          expect(::Liquid::Variable.new('url | stylesheet_tag').render(@context)).to eq(%|<link href="bootstrap.css" rel="stylesheet" type="text/css" media="all" />|)
        end

        it '#link_to' do
          @context['link'] = 'Google'

          expect(::Liquid::Variable.new("link | link_to: 'http://www.google.com.kh', 'google'").render(@context)).to eq(%|<a href="http://www.google.com.kh" title="google" class="">Google</a>|)
        end

        it '#image_tag' do
          @context['url'] = 'https://www.google.com.kh/images/srpr/logo11w.png'

          expect(::Liquid::Variable.new('url | image_tag').render(@context)).to eq(%|<img src="https://www.google.com.kh/images/srpr/logo11w.png" alt="" />|)
        end

        it "#link_to_home set 'active' class" do
          allow_message_expectations_on_nil
          @context['name'] = 'Home'
          @context.registers['controller'].stub_chain(:request, :fullpath).and_return('/')

          expect(::Liquid::Variable.new('name | link_to_home').render(@context)).to eq(%|<a href="/" title="Home" class="active">Home</a>|)
        end

        it "#link_to_home doesn't set 'active' class" do
          allow_message_expectations_on_nil
          @context['name'] = 'Home'
          @context.registers['controller'].stub_chain(:request, :fullpath).and_return('/else')

          expect(::Liquid::Variable.new('name | link_to_home').render(@context)).to eq(%|<a href="/" title="Home" class="">Home</a>|)
        end
      end
    end
  end
end