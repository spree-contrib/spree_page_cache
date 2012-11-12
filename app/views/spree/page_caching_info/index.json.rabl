node do
 { :cart_summary => @cart_summary,
   :authenticity_token => @authenticity_token,
   :current_user_id => current_user.try(:id).to_s }
end
