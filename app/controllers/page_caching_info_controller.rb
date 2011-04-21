class PageCachingInfoController < Spree::BaseController

  def index
    cart_amount = render_to_string(:partial => 'shared/cart_data')
    cookies['cart_amount'] = cart_amount

    respond_to do |format|
      format.js {
        render :json => { :cart_amount      => cart_amount }
      }
    end
  end

end
