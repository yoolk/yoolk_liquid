module Yoolk
  module Sandbox
    class InstantWebsite::Pages < Collection
      def primary
        take(5)
      end

      def more
        drop(5)
      end
    end
  end
end