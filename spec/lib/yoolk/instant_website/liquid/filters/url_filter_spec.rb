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
      end
    end
  end
end