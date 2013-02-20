SpreePageCache
===========

This gem makes it safe to fully cache pages in Spree application.

It doesn't specifiy what pages / actions to cache as that's application specific, but it does include coarse sweepers for products and taxon.

You generally need to include the following overrides into your application:

````ruby

Spree::HomeController.class_eval do
  caches_page :index
end

Spree::ProductsController.class_eval do
  caches_page :index, :show
end

Spree::TaxonsController.class_eval do
  caches_page :index, :show
end

````

NOTE: This gem hides user-specific details from pages in order to accomplish page caching. For example, it will hide the Login buttons at the top of the home page for signing in to view your cart or order history.

Setup
--------------------
Add this to your gem file Gemfile

    gem "spree_page_cache"

    rake spree_page_cache:install


Copyright (c) 2011 Neeraj Singh, released under the New BSD License

