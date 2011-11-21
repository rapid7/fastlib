# FASTLIB

FASTLIB provides a method to encode large directories of libraries into a single archive file.
This is similar to capabilities like zip/ziprequire, except that it provides workarounds for
\_\_FILE\_\_ references, arbitrary compression, and arbitrary encoding of file and name contents.

# Usage

$ apt-get install fastlib

$ `gem env gemdir`/fastlib-0.0.1/lib/fastlib.rb dump lib/myarchive.fastlib lib/ lib/*

$ ruby -r rubygems -r fastlib -I lib/myarchive.fastlib application.rb


# Credits
Rapid7 LLC
