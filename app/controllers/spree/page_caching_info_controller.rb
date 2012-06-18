module Spree
  class PageCachingInfoController < Spree::BaseController

    def index
      cart_amount = URI.escape(render_to_string(:partial => 'spree/shared/cart_data'))  # don't want screwed up plusses in my cookies
      cookies['cart_amount'] = cart_amount

      respond_to do |format|
        format.js {
          render :json => { :cart_amount      => cart_amount}
        }
      end
    end

  end
end
