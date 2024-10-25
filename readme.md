preprocessor output:
  "gcc -E main.c -o main.i"

C:\Program Files (x86)\Windows Kits\10\Lib\10.0.19041.0\um\arm64\httpapi.lib

- [XX] dictionary 
  - [X] being able to recreate something so simple delete and retry
- [-] http server
  -  GNU libmicrohttpd
  - https://www.youtube.com/watch?v=mStnzIEprH8
  - [X] get to compile
  - [X] rewrite to use windows version of socket 
  - [ ] combine the two codebases nicely
  - [ ] figure out how to get the url path
  - [ ] figure out how to check the httpmethod
  - [ ] consider it being thread safe with the iresult reuse

- [ ] consider better dynamic way of handling hashtable
- [ ] consider supporting cache expiration timing
- [ ] make it public
- [ ] bragbook entry
- [ ] consider how multi threading is handled and how to lock thread on incoming key 
- [ ] https server