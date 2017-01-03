# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require 'oversetter/version'

Gem::Specification.new do |s|
	s.name        = "oversetter"
	s.version     = Oversetter::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = "Drew Prentice"
  s.email       = "weirdpercent@gmail.com"
	s.homepage    = "http://github.com/weirdpercent/oversetter"
	s.summary     = %q{DEPRECATED: A powerful text translation tool.}
	s.description = %q{See https://github.com/drawnepicenter/toloko}
  s.license     = "MIT"
	s.post_install_message = "**NOTICE** Oversetter is deprecated, please see https://github.com/drawnepicenter/toloko for its successor.\nThanks for using oversetter!\nPlease get necessary API keys as shown in:\nhttp://github.com/weirdpercent/oversetter"

  # If you have other dependencies, add them here
  s.add_runtime_dependency "gli", "~> 2.14"
	s.add_runtime_dependency "htmlentities", "~> 4.3"
  s.add_runtime_dependency "httpi", "~> 2.4"
  s.add_runtime_dependency "metainspector", "~> 4.7"
  s.add_runtime_dependency "multi_json", "~> 1.12"
  s.add_runtime_dependency "multi_xml", "~> 0.6"
	s.add_runtime_dependency "nokogiri", "~> 1.6"
  s.add_runtime_dependency "rainbow", "~> 2.2"
  s.add_runtime_dependency "rubyntlm", "~> 0.6"
  s.add_runtime_dependency "xml-fu", "~> 0.2"
  s.add_development_dependency "aruba", "~> 0.14"
  s.add_development_dependency "bundler", "~> 1.13"
  s.add_development_dependency "coveralls", "~> 0.8"
  s.add_development_dependency "rake", "~> 12.0"
  s.add_development_dependency "spinach", "~> 0.9"
  s.add_development_dependency "yard", "~> 0.9"

  # If you need to check in files that aren't .rb files, add them here
  s.files        = Dir["{lib}/**/*.rb", "bin/*", "CHANGELOG.md"]
  s.require_path = 'lib'

  # If you need an executable, add it here
	s.executables = ["oversetter"]
end
