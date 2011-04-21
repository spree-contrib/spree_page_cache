namespace :spree_page_cache do

  desc "Copies all assets (NOTE: This will be obsolete with Rails 3.1)"
  task :install do
    Rake::Task['spree_page_caching:install:assets'].invoke
  end

  namespace :install do
    desc "Copies all assets (NOTE: This will be obsolete with Rails 3.1)"
    task :assets do
      source = File.join(File.dirname(__FILE__), '..', '..', 'public')
      destination = File.join(Rails.root, 'public')
      puts "INFO: Mirroring assets from #{source} to #{destination}"
      Spree::FileUtilz.mirror_files(source, destination)
    end
  end

end
