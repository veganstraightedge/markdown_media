# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "markdown_media/version"

Gem::Specification.new do |spec|
  spec.name          = "markdown_media"
  spec.version       = MarkdownMedia::VERSION
  spec.authors       = ["Shane Becker"]
  spec.email         = ["veganstraightedge@gmail.com"]

  spec.summary       = %q{A [[ URL ]] syntax to embed media into views.}
  spec.description   = %q{
    This syntax uses doubles square brackets on each side of a URL and optional options.
    It expands into the current preferred embed code for that site's media or raw media.
    Supported media types: YouTube, Vimeo, Instagram, Twitter, images, videos, audios.
  }
  spec.homepage      = "https://github.com/veganstraightedge/markdown_media"
  spec.license       = "CC0"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake",    "~> 10.0"
  spec.add_development_dependency "rspec",   "~> 3.0"
end
