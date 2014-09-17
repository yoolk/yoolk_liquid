module Yoolk
  module Sandbox
    class Portal::Channel::Answer < Yoolk::Sandbox::Base

      attribute :text,                    String
      attribute :price,                   Float,    default: 0.0
      attribute :is_fixed_price,          Boolean,  default: false
      attribute :is_end_channel_question, Boolean,  default: false
      attribute :channel_ids,             Array,    default: []
    end
  end
end