module Yoolk
  module Sandbox
    class Portal::Channel < Yoolk::Sandbox::Base

      attribute :id,            String
      attribute :name,          String
      attribute :color,         Boolean
      attribute :preliminary,   Boolean, default: false

      attribute :questions,     Array[Yoolk::Sandbox::Portal::Channel::Question]
    end
  end
end