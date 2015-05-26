# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tax_jar_gem/version'

Gem::Specification.new do |spec|
  spec.name          = "tax_jar_gem"
  spec.version       = TaxJarGem::VERSION
  spec.authors       = ["Gaurav Mahajan"]
  spec.email         = ["gaurav.mahajan31@gmail.com"]

  spec.summary       = %q{Integrate your rails app with taxjar.}
  spec.description   = %q{Integrate your rails app with taxjar.}
  spec.homepage      = "https://github.com/gauravmahajan31/tax-jar"
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
