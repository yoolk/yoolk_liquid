require 'spec_helper'

module Yoolk
  module InstantWebsite
    module Liquid
      describe TranslateFilter do
        let(:context) { ::Liquid::Context.new }
        before do
          context['current_theme']   = 'theme_a'
          context.registers[:helper] = ActionController::Base.helpers
        end

        it 'translate with default locale' do
          expect(::Liquid::Variable.new("'welcome' | translate").render(context)).to eq('Welcome')
        end

        it 'translate with specified locale' do
          expect(::Liquid::Variable.new("'welcome' | translate: 'km'").render(context)).to eq('សូមស្វាគមន៍')
        end

        it 'translate with scope' do
          expect(::Liquid::Variable.new("'home' | translate: 'km', 'links'").render(context)).to eq('ទំព័រដើម')
        end
      end
    end
  end
end