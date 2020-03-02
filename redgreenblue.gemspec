require_relative 'lib/redgreenblue/version'

Gem::Specification.new do |s|

  s.name     = 'redgreenblue'
  s.summary  = 'A simple Ruby library for handling RGB colors.'
  s.version  = RGB::VERSION

  s.homepage = 'https://github.com/lllisteu/redgreenblue'
  s.authors  = [ 'lllist.eu' ]
  s.license  = 'MIT'

  all_files  = `git ls-files -z`.split("\x0")
  s.files    = all_files.grep(%r{^lib/})

  s.required_ruby_version = '>=2.2.0'

  s.metadata = {
    "changelog_uri" => "https://github.com/lllisteu/redgreenblue/blob/master/History.md"
  }

end
