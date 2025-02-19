source "https://rubygems.org"
gemspec

gem "jekyll", ENV["JEKYLL_VERSION"] if ENV["JEKYLL_VERSION"]
if ENV["JEKYLL_VERSION"] == "< 4.0"
  gem "base64", "~> 0.2"
  gem "bigdecimal"
  gem "kramdown-parser-gfm", "~> 1.0"
end
