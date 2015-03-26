require 'rails_helper'

module Yoolk
  module Liquid
    describe TranslateFilter do
      before {
        context['request'] = { 'theme_name' => 'theme_a' }
      }

      it 'translates from global' do
        expect_template_result("{{ 'theme_a.hello' | translate }}", I18n.t(:hello))
      end

      it 'translates from current_theme' do
        expect_template_result("{{ 'theme_a.welcome' | translate }}", I18n.t(:'theme_a.welcome'))
      end
    end
  end
end