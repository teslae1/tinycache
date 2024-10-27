preprocessor output:
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
- [-] instance of hashtable from the runner 
  - [ ] reference it and get it to be instance 
  - [ ] prepopulate at some key with data
  - [ ] try to respond with json of that data
- [ ] make sure the incoming request can take into account a big size of json
- [ ] combine the two codebases nicely
- [ ] consider it being thread safe with the iresult reuse

- [ ] consider better dynamic way of handling hashtable
- [ ] consider supporting cache expiration timing
- [ ] make it public
- [ ] bragbook entry
- [ ] consider how multi threading is handled and how to lock thread on incoming key 
- [ ] https server