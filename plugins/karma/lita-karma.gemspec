Gem::Specification.new do |spec|
  spec.name          = "lita-karma"
  spec.version       = "0.0.1"
  spec.authors       = ["Tyler Johnston"]
  spec.email         = ["tylerjohnst@gmail.com"]
  spec.description   = "Karma"
  spec.summary       = "Karma"
  spec.homepage      = "http://www.suncoast.io/"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.2"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
