# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "jekyll-whiteglass"
  spec.version       = "0.1.0"
  spec.authors       = ["Chayoung You"]
  spec.email         = ["yousbe@gmail.com"]

  spec.summary       = %q{Minimal, responsible Jekyll theme for hackers.}
  spec.homepage      = "https://github.com/yous/whiteglass"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|_layouts|_includes|_sass|LICENSE|README)}i) }

  spec.add_runtime_dependency "jekyll", "~> 3.3"
  spec.add_runtime_dependency "jekyll-archives", "~> 2.1"
  spec.add_runtime_dependency "jekyll-paginate", "~> 1.1"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 0.12"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
