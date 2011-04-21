Rails.application.routes.draw do
  get '/page_caching_info', :to => 'page_caching_info#index'
end
