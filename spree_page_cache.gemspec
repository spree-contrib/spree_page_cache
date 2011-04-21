Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_page_cache'
  s.version     = '0.0.1'
  s.summary     = 'Makes spree work with page caching'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Neeraj Singh'
  s.email             = 'neeraj@railsdog.com'
  s.homepage          = 'http://spreecommerce.com'

  s.files        = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*', 'db/**/*', 'public/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = true

  s.add_dependency('spree', '>= 0.60.0')
  s.add_dependency('deface')
end


