require_relative 'lib/redgreenblue/version'

Gem::Specification.new do |s|

	s.name        = 'redgreenblue'
	s.summary     = 'RGB colors for Ruby'
	s.version     = RGB::VERSION

	s.homepage    = 'https://github.com/lllisteu/redgreenblue'
	s.authors     = [ 'lllist.eu' ]
	s.license     = 'MIT'

	all_files     = `git ls-files -z`.split("\x0")
	s.files       = all_files.grep(%r{^lib/})

end