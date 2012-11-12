Spree::BaseController.class_eval do

  after_filter :write_flash_to_cookie

  def write_flash_to_cookie
    # add to existing flash, as redirected responsed
    # cause this method to get called repeatedly before
    # the messages actually get displayed to the user.
    #
    cookie_flash = if cookies['flash'].present?
      JSON.parse(cookies['flash']) rescue {}
    else
      {}
    end

    flash.each do |key, value|
      if cookie_flash[key.to_s].blank?
        cookie_flash[key.to_s] = value
      else
        cookie_flash[key.to_s] << "<br/>#{value}"
      end
    end

    cookies['flash'] = cookie_flash.to_json
    flash.clear
  end
end
