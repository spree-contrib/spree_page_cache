module Spree
  module Admin
    BaseController.class_eval do

      private

      def write_flash_to_cookie
        # undo my parent's version to make this front-end-only
      end
    end
  end
end
