lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'algolia/indices/version'

Gem::Specification.new do |spec|
  spec.name          = 'algolia-indices'
  spec.version       = Algolia::Indices::VERSION
  spec.authors       = ['m-nakamura145']
  spec.email         = ['masato.nakamura145@gmail.com']

  spec.summary       = 'A command line tool for Algolia'
  spec.description   = 'A command line tool for Algolia'
  spec.homepage      = 'https://github.com/m-nakamura145/algolia-indices'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_dependency 'thor', '~> 0.20.3'
  spec.add_dependency 'faraday', '~> 0.15.3'
end
