Deface::Override.new(:virtual_path => "shared/_nav_bar",
                     :name => "auth_shared_login_bar",
                     :replace => "[data-hook='shared_login_bar'], #shared_login_bar[data-hook]",
                     :partial => "shared/auth_bar",
                     :disabled => false)

Deface::Override.new(:virtual_path => "shared/_nav_bar",
                     :name => "cart_shared_login_bar",
                     :replace => "[data-hook='shared_cart_bar'], #shared_login_bar[data-hook]",
                     :partial => "shared/cart_bar",
                     :disabled => false)

Spree::BaseController.class_eval do

  after_filter :write_flash_to_cookie

  def write_flash_to_cookie
    cookie_flash = {}

    flash.each do |key, value|
      if cookie_flash[key.to_s].blank?
        cookie_flash[key.to_s] = value
      else
        cookie_flash[key.to_s] << "<br/>#{value}"
      end
    end

    cookies['flash'] = cookie_flash.to_json
    flash.clear

    set_customizer_cookies
  end

  def set_customizer_cookies
    # store cookie values so they are always there
    cookies[:authenticity_token] = session[:_csrf_token] ||= ActiveSupport::SecureRandom.base64(32)
    cookies[:current_user_id] = current_user.try(:id)
  end

end
