## ⚠️ Deprecation notice ⚠️

Since Spree 4.1 this extension is deprecated and not needed. Spree 4.1 supports full page caching out of the box


SpreePageCache
===========

This gem makes it safe to fully cache pages in spree application.

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


Setup
--------------------
Add this to your gem file Gemfile

    gem "spree_page_cache", github: "spree/spree_page_cache"

    rake spree_page_cache:install


Copyright (c) 2011 Neeraj Singh, released under the New BSD License

