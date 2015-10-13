# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require './lib/plugins/pre-commit/checkstyle/version.rb'

Gem::Specification.new do |spec|
  spec.name          = "java-checkstyle"
  spec.version       = PreCommit::Checkstyle::VERSION
  spec.authors       = ["Allen Madsen", "Cristian Oliveira", "Alex Rocha"]
  spec.email         = ["blatyo@gmail.com", "contato@cristianoliveira.com.br"]
  spec.summary       = %q{Checkstyle linter plugin for pre-commit}
  spec.description   = %q{Checkstyle linter plugin for pre-commit. Useful for linting Java code.}
  spec.homepage      = "https://github.com/CristianOliveiraDaRosa/java-checkstyle"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency('pre-commit', '~> 0.26')
  spec.add_dependency('crack', '~> 0.4.2')

  spec.add_development_dependency("bundler", "~> 1.5")
  spec.add_development_dependency("rake", '~> 10.4', '>= 10.4.2')
  spec.add_development_dependency('rspec', '~> 3.3.0')
end
