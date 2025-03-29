# -*- encoding: utf-8 -*-
# stub: ruby-lsp-rspec 0.1.22 ruby lib

Gem::Specification.new do |s|
  s.name = "ruby-lsp-rspec".freeze
  s.version = "0.1.22".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/st0012/ruby-lsp-rspec/releases", "homepage_uri" => "https://github.com/st0012/ruby-lsp-rspec", "source_code_uri" => "https://github.com/st0012/ruby-lsp-rspec" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Stan Lo".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-02-03"
  s.description = "RSpec addon for ruby-lsp".freeze
  s.email = ["stan001212@gmail.com".freeze]
  s.homepage = "https://github.com/st0012/ruby-lsp-rspec".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0.0".freeze)
  s.rubygems_version = "3.5.6".freeze
  s.summary = "RSpec addon for ruby-lsp".freeze

  s.installed_by_version = "3.5.6".freeze if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<ruby-lsp>.freeze, ["~> 0.23.0".freeze])
end
