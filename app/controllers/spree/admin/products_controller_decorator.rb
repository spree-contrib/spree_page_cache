Spree::Admin::ProductsController.class_eval do
  cache_sweeper Spree::ProductSweeper, :only => [:update, :destroy, :create]
end
