# encoding: utf-8
 
task :build => :update do
	Rake::Task['clean'].execute
	puts "[*] Building fastlib.gemspec"
	system "gem build fastlib.gemspec &> /dev/null"
end
 
task :release => :build do
	puts "[*] Pushing fastlib to rubygems.org"
	system "gem push fastlib-*.gem &> /dev/null"
	Rake::Task['clean'].execute
end

task :clean do
	system "rm -f *.gem >/dev/null 2>&1"
end

task :update do
end
