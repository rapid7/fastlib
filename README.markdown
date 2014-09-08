# FastLib

FastLib provides a method to encode large directories of libraries into a single archive file.
This is similar to capabilities like zip/ziprequire, except that it provides workarounds for
\_\_FILE\_\_ references, arbitrary compression, and arbitrary encryption of file and name contents.

# Usage

    $ gem install fastlib

#### Store a library in a FastLib archive
    $ fastlib create mylib.fastlib /path/to/mylib

#### Use that archive just by including the containing directory
    $ ruby -r fastlib -I . ./myapp.rb

#### Store a library in a FastLib archive with compression
    $ fastlib create -c mylib.fastlib /path/to/mylib

#### Store a library in a FastLib archive with default "encryption"
    $ fastlib create -e 0 mylib.fastlib /path/to/mylib

#### Store a library in a FastLib archive with default "encryption" and compression
    $ fastlib create -c -e 0 mylib.fastlib /path/to/mylib

#### Store a library in a FastLib archive with custom encryption and compression
    $ fastlib create -I . -r mycrypto -c -e 0xdeadee mylib.fastlib /path/to/mylib

```
$ cat mycrypto.rb

    require 'openssl'
    
    class FastLib
    
        def self.encrypt_deadee00(data)
          # Encrypt
        end
    
        def self.decrypt_deadee00(data)
          # Decrypt
        end
    
    end
```

# Credits
Rapid7, Inc.
