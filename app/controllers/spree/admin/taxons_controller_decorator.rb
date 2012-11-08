Spree::Admin::TaxonsController.class_eval do
  cache_sweeper Spree::TaxonSweeper, :only => [:update, :destroy, :create]
end
