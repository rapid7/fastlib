#!/usr/bin/env ruby

$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), "..", "lib")))

require 'fastlib'
require 'optparse'
require 'ostruct'


options = OpenStruct.new(action: nil, archive: nil, required: nil, included: nil, compress: nil, encrypt: nil, verbose: nil)

option_parser = OptionParser.new do |opts|
  opts.banner = "Usage: #{$0} <action> [options] <arguments>"
  opts.separator "Create or list the contents of a fastlib archive"
  opts.separator ""
  opts.separator "Options"

  opts.on("-c", "--compress", "Compresses the archive with Zlib ") do 
    options.compress = true
  end

  opts.on("-e", "--encrypt 0x<Algorithm ID>", "Encrypt the archive with the specified algorithm ID (0x00 for XOR)") do |opt_encrypt|
    if opt_encrypt =~ /^0x/
      options.encrypt = opt_encrypt.to_i(16)
    else
      options.encrypt = opt_encrypt.to_i
    end

    if options.encrypt > 0xffffff
      $stderr.puts "Error: Algorithm IDs must be between 0 and 0xffffff"
      exit(1)
    end
  end

  opts.on("-r", "--require library", "Require the specified library to support custom encryption methods") do |opt_require|
    options.required ||= []
    options.required << opt_require
  end

  opts.on("-I", "--include library_path", "Search the specified path for required libraries") do |opt_include|
    $:.append opt_include
  end

  opts.on("-V", "--version", "Show the FastLib version") do
    $stderr.puts "FastLib v#{FastLib::VERSION}"
    exit(0)
  end

  opts.on("-h", "--help", "Show this message.") do
    $stderr.puts opts
    exit(1)
  end
end
option_parser.parse!(ARGV)

# Load any libraries required to support custom encryption providers
if options.required
  options.required.each {|lname| require(lname) }
end

if options.encrypt
  # Verify that our 24-bit algorithm ID maps to a FastLib namespace method
  # The user may need to specify -r provider to load the right library first
  unless FastLib.respond_to?(sprintf("encrypt_%.8x", (options.encrypt<<8) ))
    $stderr.puts "Error: Unknown algorithm ID, you may need to specify the provider library with -r"
    exit(1)
  end
end

options.action  = ARGV.shift
options.archive = ARGV.shift

unless options.archive
  $stderr.puts "Error: No archive file has been specified"
  exit(1)
end

case options.action
when 'create'
  
  source_path = ARGV.shift
  
  unless source_path
    $stderr.puts "Error: No source directory has been specified"
    exit(1)    
  end
  
  source_path  = File.expand_path(source_path)
  source_files = Dir["#{source_path}/*"]
  
  create_flags = 0
  
  if options.compress
    create_flags |= FastLib::FLAG_COMPRESS
  end

  if options.encrypt
    create_flags |= (options.encrypt<<8)
    create_flags |= FastLib::FLAG_ENCRYPT
  end

  FastLib.create(options.archive, create_flags, source_path, *source_files)

when 'list'
  $stdout.puts "Library: #{options.archive}"
  $stdout.puts "====================================================="
  FastLib.list(options.archive).each do |name|
    fsize = FastLib.cache[options.archive][name][1]
    ftime = ::Time.at(FastLib.cache[options.archive][name][2]).strftime("%Y-%m-%d %H:%M:%S")
    $stdout.puts sprintf("%9d\t%20s\t%s\n", fsize, ftime, name)
  end
  $stdout.puts ""
else
  $stderr.puts "Error: Unknown action '#{options.action}'"
  exit(1)
end
