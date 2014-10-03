module Yoolk
  module Sandbox
    class Account < Yoolk::Sandbox::Base
      attribute :id,        String
      attribute :person,    Yoolk::Sandbox::Account::Person

      def self.find(name)
        path       = Rails.root.join('db', 'samples', 'jsons', "#{name}.json")
        return {} unless File.exists? path

        attributes = Oj.load(File.read(path))
        new(attributes)
      end
    end
  end
end