require File.expand_path('../lib/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'bot'
  gem.version       = ToyRobotVersion::VERSION
  gem.summary       = %q{A Simple Toy Robot}
  gem.description   = %q{A toy robot which can run on commands on a specified size of a table top}
  gem.license       = "MIT"
  gem.authors       = ["Miheer Salunke"]
  gem.email         = "miheer.salunke@gmail.com"
  gem.homepage      = "https://rubygems.org/gems/toyrobot"

  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
  gem.add_dependency 'thor', '~> 0.19.1'
  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'rake', '~> 10.4.2'
  gem.add_development_dependency 'rspec-core', '~> 3.2.0'
  gem.add_development_dependency 'rspec-expectations', '~>3.2.0'
  gem.add_development_dependency 'rspec-mocks', '~>3.2.0'
  #gem.add_development_dependency 'rspec', '~> 3.2.0'
end
