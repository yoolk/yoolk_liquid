module Yoolk
  module Liquid
    module TranslateFilter
      include ::Liquid::Rails::TranslateFilter

      ## Translate the key with default (without theme_name)
      ## so that it will pick up global locale keys when the key doesn't exists
      #
      #  eg. {{ 'theme_a.hello' | translate }} translate this key if exists
      #      Otherwise it will be the same as {{ 'hello' | translate }}
      def translate_with_default(key, options={})
        key        = key.to_s
        theme_name = @context['request.theme_name']

        if key.start_with?(theme_name)
          options = options.reverse_merge(default: key.gsub(/^#{theme_name}\./, '').to_sym)
        end

        translate_without_default(key, options)
      end
      alias_method_chain :translate, :default
    end
  end
end

Liquid::Template.register_filter Yoolk::Liquid::TranslateFilter