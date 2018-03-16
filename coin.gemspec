lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coin/version'

Gem::Specification.new do |spec|
  spec.name          = 'coin'
  spec.version       = Coin::VERSION
  spec.authors       = ['Kelvin Smith']
  spec.email         = ['oneKelvinSmith@gmail.com']

  spec.summary       = 'An example of AES encryption using ruby'
  spec.description   = 'An example of AES encryption using ruby'
  spec.homepage      = 'https://github.com/onekelvinsmith/coin'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'pry', '~> 0.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.52'
end
