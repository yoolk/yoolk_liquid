module Yoolk
  module Sandbox
    class InstantWebsite::Pages < Collection
      def primary
        # select { |item| item.type.downcase == 'e-mail' }
      end

      def more
        # select { |item| item.type.downcase == 'website' }
      end
    end
  end
end