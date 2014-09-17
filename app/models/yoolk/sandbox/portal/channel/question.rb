module Yoolk
  module Sandbox
    class Portal::Channel::Question < Yoolk::Sandbox::Base

      attribute :text,                  String
      attribute :description,           String
      attribute :is_multiple_answer,    Boolean, default: false

      attribute :answers,               Array[Yoolk::Sandbox::Portal::Channel::Answer]
    end
  end
end