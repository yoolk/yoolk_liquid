module Yoolk
  module Sandbox
    class Account < Yoolk::Sandbox::Base
      attribute :id,        Integer
      attribute :person,    Yoolk::Sandbox::Person

      ## Delegate
      delegate   :avatar,   to: :person,
                            allow_nil: true

      def self.find(name)
        path       = Rails.root.join('db', 'samples', 'jsons', "#{name}.json")
        return nil unless File.exists? path

        attributes = Oj.load(File.read(path))
        new(attributes)
      end
    end
  end
end