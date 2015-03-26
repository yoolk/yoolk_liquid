require 'rails_helper'

module Yoolk
  module Liquid
    describe BaseDrop do
      it { should include_module(Yoolk::Liquid::UrlFilter) }
      it { should include_module(Yoolk::Liquid::TranslateFilter) }

      it '#id' do
        object = OpenStruct.new(id: BSON::Id.new(12365657576))
        drop   = BaseDrop.new(object)

        expect(drop.id).to eq('12365657576')
      end
    end
  end
end