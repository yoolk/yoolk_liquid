require 'spec_helper'

module Yoolk
  module InstantWebsite
    module Liquid
      describe MiscFilter do
        let(:context) { ::Liquid::Context.new }

        context '#index' do
          it 'returns value at the specified index' do
            context['array'] = [1, 2, 3]
            expect(::Liquid::Variable.new("array | index: 0").render(context)).to eq(1)
          end

          it 'returns nil when outside range' do
            context['array'] = [1, 2, 3]
            expect(::Liquid::Variable.new("array | index: 5").render(context)).to eq(nil)
          end
        end

        context '#default' do
          it 'returns default value when input is blank' do
            context['value'] = nil
            expect(::Liquid::Variable.new("value | default: 'hello'").render(context)).to eq('hello')
          end

          it 'returns default value when input is blank' do
            context['value'] = 'value'
            expect(::Liquid::Variable.new("value | default: 'hello'").render(context)).to eq('value')
          end
        end

        it '#json' do
          context['listing'] = { name: 'Listing A' }
          expect(::Liquid::Variable.new("listing | json").render(context)).to eq(%|{"name":"Listing A"}|)
        end
      end
    end
  end
end