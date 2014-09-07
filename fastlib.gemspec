# encoding: utf-8

APP_NAME = "fastlib"
VERSION = "0.0.8"

Gem::Specification.new do |s|
	s.name                  = APP_NAME
	s.version               = VERSION
	s.homepage              = "https://github.com/rapid7/fastlib"
	s.summary               = "FASTLIB archive library"
	s.description           = "This gem provides a way to load libraries from an archive"
	s.license               = "BSD"
	s.authors               = ["HD Moore"]
	s.email		              = ["hdm@rapid7.com"]
	s.files                 = `git ls-files`.split("\n")
  s.test_files            = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables           = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths         = ['lib']
	s.extra_rdoc_files      = ["README.markdown"]
	s.required_ruby_version = ">= 1.9.3"
	s.platform              = "ruby"
end
