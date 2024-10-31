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
- [-] support setting the value by key
  - [X] take incoming body value and extract to str
    - finish the readBody method
    - [X] get the content-length
    - [X] use that to read the body
  - [X] respond ok by the new method
  - [X] reuse that method for the get responsk
- [X] make sure the incoming request can take into account a big size of json
- [-] consider extracting some sub functions
  - [-] server setup
  - [ ] run socket listen loop
  - [ ] extract incoming request from client
  - [ ] handle get 
  - [ ] handle put
- [ ] make sure error 400 on too big incoming
- [ ] should one free *val inside while loop or is that another part of the systems responsability
- [ ] figure out if for loop inside of hashtable should discard pointers on existing instead of override values?
- [ ] handle null from read body by bad request
- [ ] in insert - when encountering something that is existing, figure out if should free that
- [ ] run through entire program an search for things that are not free
- [ ] check all warnings
- [ ] combine the two codebases nicely
- [ ] consider it being thread safe with the iresult reuse

- [ ] consider better dynamic way of handling hashtable
- [ ] consider supporting cache expiration timing
- [ ] make it public
- [ ] bragbook entry
- [ ] consider how multi threading is handled and how to lock thread on incoming key 
- [ ] https server