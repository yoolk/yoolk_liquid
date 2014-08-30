module Yoolk
  module InstantWebsite
    module Liquid
      module TranslateFilter
        def translate(key, locale = nil, scope = nil)
          locale ||= I18n.locale.to_s
          scope    = if scope.blank?
            @context['current_theme']
          else
            "#{@context['current_theme']}.#{scope}"
          end

          @context.registers[:helper].translate(key.to_s, locale: locale, scope: scope)
        end
      end
    end
  end
end

Liquid::Template.register_filter Yoolk::InstantWebsite::Liquid::TranslateFilter