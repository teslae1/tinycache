jreprocessor output:
  "gcc -E main.c -o main.i"


C:\Program Files (x86)\Windows Kits\10\Lib\10.0.19041.0\um\arm64\httpapi.lib

- [X] dictionary 
  - [X] being able to recreate something so simple delete and retry
- [-] http server
  -  GNU libmicrohttpd
  - https://www.youtube.com/watch?v=mStnzIEprH8
  - [X] get to compile
  - [X] rewrite to use windows version of socket 
- [X] figure out how to get the url path
  - just got runtime going again with non nullable for accept arg
  - lets check the data in the new pointer after accept 
- [X] figure out how to check the httpmethod
- [X] instance of hashtable from the runner 
  - [X] reference it and get it to be instance 
  - [X] prepopulate at some key with data
  - [X] code the get method and make sure it works
  - [X] try to respond with json of that data
    - [X] fix get method silent error - compile and run right now errors
- [X] support setting the value by key
  - [X] take incoming body value and extract to str
    - finish the readBody method
    - [X] get the content-length
    - [X] use that to read the body
  - [X] respond ok by the new method
  - [X] reuse that method for the get responsk
- [X] make sure the incoming request can take into account a big size of json
- [X] extracting some sub functions
  - [X] server setup
    - [X] consider disposing serversetup since the data that is being used are subset pointers
  - [X] run socket listen loop
  - [X] extract incoming request from client
- [X] should one free *val inside while loop or is that another part of the systems responsability
- [X] figure out if for loop inside of hashtable should discard pointers on existing instead of override values?
- [X] check all warnings
- [X] combine the two codebases nicely
- [-] supporting cache expiration timing
  - [X] Incoming header as cache time on put 
    - [X] Make sure that the buffer is unmodified from readbody
  - [X] Save as value at hashitem
  - [-] Have cleanup thread
    - [X] Store insertionTime
    - [X] background run 
    - [-] cleanup mechanism that compares 
- [ ] make it public
- [ ] bragbook entry