# encoding: utf-8

APP_NAME = "fastlib"
VERSION = "0.0.1"

Gem::Specification.new do |s|
	s.name                  = APP_NAME
	s.version               = VERSION
	s.homepage              = "https://github.com/rapid7/fastlib"
	s.summary               = "FASTLIB archive library"
	s.description           = "This gem provides a way to load libraries from an archive"
	s.license               = "BSD"
	s.authors               = ["HD Moore"]
	s.email		        	= ["hdm@metasploit.com"]
	s.files                 = Dir['[A-Z]*'] + Dir['lib/**/*']
	s.require_paths         = ["lib"]
	s.extra_rdoc_files      = ["README.markdown"]
	s.required_ruby_version = ">= 1.8.7"
	s.platform              = "ruby"
end
