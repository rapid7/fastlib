# FASTLIB

FASTLIB provides a method to encode large directories of libraries into a single archive file.
This is similar to capabilities like zip/ziprequire, except that it provides workarounds for
\_\_FILE\_\_ references, arbitrary compression, and arbitrary encoding of file and name contents.

# Usage

$ apt-get install fastlib

## Store a library structure into FASTLIB archive
    $ `gem env gemdir`/gems/fastlib-\*/lib/fastlib.rb store 00000000 myarchive.fastlib lib/ lib/\*
    $ rm -rf lib

## Use that archive just by including the containing directory
    $ ruby -r rubygems -r fastlib -I. ./app.rb

## Store a library structure into a FASTLIB archive with compression
    $ `gem env gemdir`/gems/fastlib-\*/lib/fastlib.rb store 00000001 myarchive.fastlib lib/ lib/\*

## Store a library structure into a FASTLIB archive with default "encryption"
    $ `gem env gemdir`/gems/fastlib-\*/lib/fastlib.rb store 00000002 myarchive.fastlib lib/ lib/\*

## Store a library structure into a FASTLIB archive with default "encryption" and compression
    $ `gem env gemdir`/gems/fastlib-\*/lib/fastlib.rb store 00000003 myarchive.fastlib lib/ lib/\*

## Store a library structure into a FASTLIB archive with custom encryption and compression
    $ ruby -I . -r mycrypto.rb `gem env gemdir`/gems/fastlib-\*/lib/fastlib.rb store 13370003 myarchive.fastlib lib/ lib/\*

$ cat mycrypto.rb

    require 'openssl'
    
    class FastLib
    
        def self.encrypt_13370000(data)
	        # Encrypt
        end
    
        def self.decrypt_13370000(data)
	        # Decrypt
        end
    
    end


# Credits
Rapid7 LLC
