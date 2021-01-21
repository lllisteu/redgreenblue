require_relative 'lib/redgreenblue/version'

Gem::Specification.new do |s|

  s.name     = 'redgreenblue'
  s.summary  = 'A simple Ruby library for handling RGB colors.'
  s.version  = RGB::VERSION

  s.homepage = 'https://github.com/lllisteu/redgreenblue'
  s.authors  = [ 'lllist.eu' ]
  s.license  = 'MIT'

  all_files     = `git ls-files -z`.split("\x0")
  s.files       = all_files.grep(%r{^(bin|lib)/})
  s.executables = all_files.grep(%r{^bin/.+}) { |f| File.basename(f) }

  s.required_ruby_version = '>=2.2.0'

  s.metadata = {
    'homepage_uri'      => 'https://github.com/lllisteu/redgreenblue',
    'changelog_uri'     => 'https://github.com/lllisteu/redgreenblue/blob/master/History.md',
    'documentation_uri' => 'https://www.rubydoc.info/gems/redgreenblue/RGB',
  }

end
