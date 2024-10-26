# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"

# 1 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/stdio.h" 1 3
# 9 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/stdio.h" 3
# 1 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/_mingw.h" 1 3
# 22 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/_mingw.h" 3
# 1 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/_mingw_mac.h" 1 3
# 23 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/_mingw.h" 2 3
# 200 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/_mingw.h" 3
#pragma pack(push,_CRT_PACKING)

# 1 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/vadefs.h" 1 3
# 13 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/vadefs.h" 3
# 1 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/_mingw.h" 1 3
# 595 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/_mingw.h" 3
# 1 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/sdks/_mingw_directx.h" 1 3
# 596 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/_mingw.h" 2 3
# 14 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/vadefs.h" 2 3




#pragma pack(push,_CRT_PACKING)
# 32 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/vadefs.h" 3
  typedef unsigned long uintptr_t;






  typedef __builtin_va_list __gnuc_va_list;




  typedef __gnuc_va_list va_list;
# 81 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/vadefs.h" 3
#pragma pack(pop)
# 203 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/_mingw.h" 2 3
# 295 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/_mingw.h" 3
  typedef unsigned int size_t;
# 305 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/_mingw.h" 3
  typedef int ssize_t;
# 317 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/_mingw.h" 3
  typedef int intptr_t;
# 343 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/_mingw.h" 3
  typedef int ptrdiff_t;







  typedef unsigned short wchar_t;







  typedef unsigned short wint_t;
  typedef unsigned short wctype_t;
# 389 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/_mingw.h" 3
  typedef int errno_t;




  typedef long __time32_t;




  __extension__ typedef long long __time64_t;





  typedef __time32_t time_t;
# 528 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/_mingw.h" 3
  struct threadlocaleinfostruct;
  struct threadmbcinfostruct;
  typedef struct threadlocaleinfostruct *pthreadlocinfo;
  typedef struct threadmbcinfostruct *pthreadmbcinfo;
  struct __lc_time_data;

  typedef struct localeinfo_struct {
    pthreadlocinfo locinfo;
    pthreadmbcinfo mbcinfo;
  } _locale_tstruct,*_locale_t;



  typedef struct tagLC_ID {
    unsigned short wLanguage;
    unsigned short wCountry;
    unsigned short wCodePage;
  } LC_ID,*LPLC_ID;




  typedef struct threadlocaleinfostruct {
    int refcount;
    unsigned int lc_codepage;
    unsigned int lc_collate_cp;
    unsigned long lc_handle[6];
    LC_ID lc_id[6];
    struct {
      char *locale;
      wchar_t *wlocale;
      int *refcount;
      int *wrefcount;
    } lc_category[6];
    int lc_clike;
    int mb_cur_max;
    int *lconv_intl_refcount;
    int *lconv_num_refcount;
    int *lconv_mon_refcount;
    struct lconv *lconv;
    int *ctype1_refcount;
    unsigned short *ctype1;
    const unsigned short *pctype;
    const unsigned char *pclmap;
    const unsigned char *pcumap;
    struct __lc_time_data *lc_time_curr;
  } threadlocinfo;







  const char *__mingw_get_crt_info (void);





#pragma pack(pop)
# 10 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/stdio.h" 2 3

# 1 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/_mingw_print_push.h" 1 3
# 12 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/stdio.h" 2 3

#pragma pack(push,_CRT_PACKING)
# 26 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/stdio.h" 3
  struct _iobuf {
    char *_ptr;
    int _cnt;
    char *_base;
    int _flag;
    int _file;
    int _charbuf;
    int _bufsiz;
    char *_tmpfname;
  };
  typedef struct _iobuf FILE;
# 84 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/stdio.h" 3
  typedef long _off_t;

  typedef long off_t;






  __extension__ typedef long long _off64_t;

  __extension__ typedef long long off64_t;
# 108 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/stdio.h" 3
extern FILE (* _imp___iob)[];
# 120 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/stdio.h" 3
  __extension__ typedef long long fpos_t;
# 157 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/stdio.h" 3
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _filbuf(FILE *_File);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _flsbuf(int _Ch,FILE *_File);



  __attribute__ ((__dllimport__)) FILE *__attribute__((__cdecl__)) _fsopen(const char *_Filename,const char *_Mode,int _ShFlag);

  void __attribute__((__cdecl__)) clearerr(FILE *_File);
  int __attribute__((__cdecl__)) fclose(FILE *_File);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _fcloseall(void);



  __attribute__ ((__dllimport__)) FILE *__attribute__((__cdecl__)) _fdopen(int _FileHandle,const char *_Mode);

  int __attribute__((__cdecl__)) feof(FILE *_File);
  int __attribute__((__cdecl__)) ferror(FILE *_File);
  int __attribute__((__cdecl__)) fflush(FILE *_File);
  int __attribute__((__cdecl__)) fgetc(FILE *_File);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _fgetchar(void);
  int __attribute__((__cdecl__)) fgetpos(FILE *_File ,fpos_t *_Pos);
  char *__attribute__((__cdecl__)) fgets(char *_Buf,int _MaxCount,FILE *_File);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _fileno(FILE *_File);



  __attribute__ ((__dllimport__)) char *__attribute__((__cdecl__)) _tempnam(const char *_DirName,const char *_FilePrefix);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _flushall(void);
  FILE *__attribute__((__cdecl__)) fopen(const char *_Filename,const char *_Mode);
  FILE *fopen64(const char *filename,const char *mode);
  int __attribute__((__cdecl__)) fprintf(FILE *_File,const char *_Format,...);
  int __attribute__((__cdecl__)) fputc(int _Ch,FILE *_File);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _fputchar(int _Ch);
  int __attribute__((__cdecl__)) fputs(const char *_Str,FILE *_File);
  size_t __attribute__((__cdecl__)) fread(void *_DstBuf,size_t _ElementSize,size_t _Count,FILE *_File);
  FILE *__attribute__((__cdecl__)) freopen(const char *_Filename,const char *_Mode,FILE *_File);
  int __attribute__((__cdecl__)) fscanf(FILE *_File,const char *_Format,...);
  int __attribute__((__cdecl__)) fsetpos(FILE *_File,const fpos_t *_Pos);
  int __attribute__((__cdecl__)) fseek(FILE *_File,long _Offset,int _Origin);
   int fseeko64(FILE* stream, _off64_t offset, int whence);
  long __attribute__((__cdecl__)) ftell(FILE *_File);
  _off64_t ftello64(FILE * stream);
  __extension__ int __attribute__((__cdecl__)) _fseeki64(FILE *_File,long long _Offset,int _Origin);
  __extension__ long long __attribute__((__cdecl__)) _ftelli64(FILE *_File);
  size_t __attribute__((__cdecl__)) fwrite(const void *_Str,size_t _Size,size_t _Count,FILE *_File);
  int __attribute__((__cdecl__)) getc(FILE *_File);
  int __attribute__((__cdecl__)) getchar(void);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _getmaxstdio(void);
  char *__attribute__((__cdecl__)) gets(char *_Buffer);
  int __attribute__((__cdecl__)) _getw(FILE *_File);


  void __attribute__((__cdecl__)) perror(const char *_ErrMsg);

  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _pclose(FILE *_File);
  __attribute__ ((__dllimport__)) FILE *__attribute__((__cdecl__)) _popen(const char *_Command,const char *_Mode);




  int __attribute__((__cdecl__)) printf(const char *_Format,...);
  int __attribute__((__cdecl__)) putc(int _Ch,FILE *_File);
  int __attribute__((__cdecl__)) putchar(int _Ch);
  int __attribute__((__cdecl__)) puts(const char *_Str);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _putw(int _Word,FILE *_File);


  int __attribute__((__cdecl__)) remove(const char *_Filename);
  int __attribute__((__cdecl__)) rename(const char *_OldFilename,const char *_NewFilename);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _unlink(const char *_Filename);

  int __attribute__((__cdecl__)) unlink(const char *_Filename);


  void __attribute__((__cdecl__)) rewind(FILE *_File);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _rmtmp(void);
  int __attribute__((__cdecl__)) scanf(const char *_Format,...);
  void __attribute__((__cdecl__)) setbuf(FILE *_File,char *_Buffer);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _setmaxstdio(int _Max);
  __attribute__ ((__dllimport__)) unsigned int __attribute__((__cdecl__)) _set_output_format(unsigned int _Format);
  __attribute__ ((__dllimport__)) unsigned int __attribute__((__cdecl__)) _get_output_format(void);
  unsigned int __attribute__((__cdecl__)) __mingw_set_output_format(unsigned int _Format);
  unsigned int __attribute__((__cdecl__)) __mingw_get_output_format(void);




  int __attribute__((__cdecl__)) setvbuf(FILE *_File,char *_Buf,int _Mode,size_t _Size);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _scprintf(const char *_Format,...);
  int __attribute__((__cdecl__)) sscanf(const char *_Src,const char *_Format,...);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _snscanf(const char *_Src,size_t _MaxCount,const char *_Format,...);
  FILE *__attribute__((__cdecl__)) tmpfile(void);
  char *__attribute__((__cdecl__)) tmpnam(char *_Buffer);
  int __attribute__((__cdecl__)) ungetc(int _Ch,FILE *_File);
  int __attribute__((__cdecl__)) vfprintf(FILE *_File,const char *_Format,va_list _ArgList);
  int __attribute__((__cdecl__)) vprintf(const char *_Format,va_list _ArgList);

  extern
    __attribute__((__format__ (gnu_printf, 3, 0)))
    __attribute__((__nonnull__ (3)))
    int __attribute__((__cdecl__)) __mingw_vsnprintf(char *_DstBuf,size_t _MaxCount,const char *_Format,
      va_list _ArgList);
  extern
    __attribute__((__format__ (gnu_printf, 3, 4))) __attribute__((__nonnull__ (3)))
    int __attribute__((__cdecl__)) __mingw_snprintf(char* s, size_t n, const char* format, ...);
  extern
    __attribute__((__format__ (gnu_printf, 1, 2))) __attribute__((__nonnull__ (1)))
    int __attribute__((__cdecl__)) __mingw_printf( const char *, ... ) __attribute__ ((__nothrow__));
  extern
    __attribute__((__format__ (gnu_printf, 1, 0))) __attribute__((__nonnull__ (1)))
    int __attribute__((__cdecl__)) __mingw_vprintf (const char *, va_list) __attribute__ ((__nothrow__));
  extern
    __attribute__((__format__ (gnu_printf, 2, 3))) __attribute__((__nonnull__ (2)))
    int __attribute__((__cdecl__)) __mingw_fprintf (FILE *, const char *, ...) __attribute__ ((__nothrow__));
  extern
    __attribute__((__format__ (gnu_printf, 2, 0))) __attribute__((__nonnull__ (2)))
    int __attribute__((__cdecl__)) __mingw_vfprintf (FILE *, const char *, va_list) __attribute__ ((__nothrow__));
  extern
    __attribute__((__format__ (gnu_printf, 2, 3))) __attribute__((__nonnull__ (2)))
    int __attribute__((__cdecl__)) __mingw_sprintf (char *, const char *, ...) __attribute__ ((__nothrow__));
  extern
    __attribute__((__format__ (gnu_printf, 2, 0))) __attribute__((__nonnull__ (2)))
    int __attribute__((__cdecl__)) __mingw_vsprintf (char *, const char *, va_list) __attribute__ ((__nothrow__));
  int __attribute__((__cdecl__)) vsnprintf(char *_DstBuf,size_t _MaxCount,const char *_Format,va_list _ArgList);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _snprintf(char *_Dest,size_t _Count,const char *_Format,...);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _vsnprintf(char *_Dest,size_t _Count,const char *_Format,va_list _Args);
  int __attribute__((__cdecl__)) sprintf(char *_Dest,const char *_Format,...);
  int __attribute__((__cdecl__)) vsprintf(char *_Dest,const char *_Format,va_list _Args);

  int __attribute__((__cdecl__)) snprintf(char* s, size_t n, const char* format, ...);





  int __attribute__((__cdecl__)) vscanf(const char * Format, va_list argp);
  int __attribute__((__cdecl__)) vfscanf (FILE * fp, const char * Format,va_list argp);
  int __attribute__((__cdecl__)) vsscanf (const char * _Str,const char * Format,va_list argp);

  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _vscprintf(const char *_Format,va_list _ArgList);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _set_printf_count_output(int _Value);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _get_printf_count_output(void);
# 309 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/stdio.h" 3
  __attribute__ ((__dllimport__)) FILE *__attribute__((__cdecl__)) _wfsopen(const wchar_t *_Filename,const wchar_t *_Mode,int _ShFlag);

  wint_t __attribute__((__cdecl__)) fgetwc(FILE *_File);
  __attribute__ ((__dllimport__)) wint_t __attribute__((__cdecl__)) _fgetwchar(void);
  wint_t __attribute__((__cdecl__)) fputwc(wchar_t _Ch,FILE *_File);
  __attribute__ ((__dllimport__)) wint_t __attribute__((__cdecl__)) _fputwchar(wchar_t _Ch);
  wint_t __attribute__((__cdecl__)) getwc(FILE *_File);
  wint_t __attribute__((__cdecl__)) getwchar(void);
  wint_t __attribute__((__cdecl__)) putwc(wchar_t _Ch,FILE *_File);
  wint_t __attribute__((__cdecl__)) putwchar(wchar_t _Ch);
  wint_t __attribute__((__cdecl__)) ungetwc(wint_t _Ch,FILE *_File);
  wchar_t *__attribute__((__cdecl__)) fgetws(wchar_t *_Dst,int _SizeInWords,FILE *_File);
  int __attribute__((__cdecl__)) fputws(const wchar_t *_Str,FILE *_File);
  __attribute__ ((__dllimport__)) wchar_t *__attribute__((__cdecl__)) _getws(wchar_t *_String);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _putws(const wchar_t *_Str);
  int __attribute__((__cdecl__)) fwprintf(FILE *_File,const wchar_t *_Format,...);
  int __attribute__((__cdecl__)) wprintf(const wchar_t *_Format,...);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _scwprintf(const wchar_t *_Format,...);
  int __attribute__((__cdecl__)) vfwprintf(FILE *_File,const wchar_t *_Format,va_list _ArgList);
  int __attribute__((__cdecl__)) vwprintf(const wchar_t *_Format,va_list _ArgList);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) swprintf(wchar_t*, const wchar_t*, ...);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) vswprintf(wchar_t*, const wchar_t*,va_list);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _swprintf_c(wchar_t *_DstBuf,size_t _SizeInWords,const wchar_t *_Format,...);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _vswprintf_c(wchar_t *_DstBuf,size_t _SizeInWords,const wchar_t *_Format,va_list _ArgList);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _snwprintf(wchar_t *_Dest,size_t _Count,const wchar_t *_Format,...);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _vsnwprintf(wchar_t *_Dest,size_t _Count,const wchar_t *_Format,va_list _Args);

  int __attribute__((__cdecl__)) snwprintf (wchar_t* s, size_t n, const wchar_t* format, ...);
  int __attribute__((__cdecl__)) vsnwprintf (wchar_t *, size_t, const wchar_t *, va_list);



  int __attribute__((__cdecl__)) vwscanf (const wchar_t *, va_list);
  int __attribute__((__cdecl__)) vfwscanf (FILE *,const wchar_t *,va_list);
  int __attribute__((__cdecl__)) vswscanf (const wchar_t *,const wchar_t *,va_list);

  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _swprintf(wchar_t *_Dest,const wchar_t *_Format,...);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _vswprintf(wchar_t *_Dest,const wchar_t *_Format,va_list _Args);
# 361 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/stdio.h" 3
  __attribute__ ((__dllimport__)) wchar_t *__attribute__((__cdecl__)) _wtempnam(const wchar_t *_Directory,const wchar_t *_FilePrefix);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _vscwprintf(const wchar_t *_Format,va_list _ArgList);
  int __attribute__((__cdecl__)) fwscanf(FILE *_File,const wchar_t *_Format,...);
  int __attribute__((__cdecl__)) swscanf(const wchar_t *_Src,const wchar_t *_Format,...);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _snwscanf(const wchar_t *_Src,size_t _MaxCount,const wchar_t *_Format,...);
  int __attribute__((__cdecl__)) wscanf(const wchar_t *_Format,...);
  __attribute__ ((__dllimport__)) FILE *__attribute__((__cdecl__)) _wfdopen(int _FileHandle ,const wchar_t *_Mode);
  __attribute__ ((__dllimport__)) FILE *__attribute__((__cdecl__)) _wfopen(const wchar_t *_Filename,const wchar_t *_Mode);
  __attribute__ ((__dllimport__)) FILE *__attribute__((__cdecl__)) _wfreopen(const wchar_t *_Filename,const wchar_t *_Mode,FILE *_OldFile);


  __attribute__ ((__dllimport__)) void __attribute__((__cdecl__)) _wperror(const wchar_t *_ErrMsg);

  __attribute__ ((__dllimport__)) FILE *__attribute__((__cdecl__)) _wpopen(const wchar_t *_Command,const wchar_t *_Mode);



  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wremove(const wchar_t *_Filename);
  __attribute__ ((__dllimport__)) wchar_t *__attribute__((__cdecl__)) _wtmpnam(wchar_t *_Buffer);
  __attribute__ ((__dllimport__)) wint_t __attribute__((__cdecl__)) _fgetwc_nolock(FILE *_File);
  __attribute__ ((__dllimport__)) wint_t __attribute__((__cdecl__)) _fputwc_nolock(wchar_t _Ch,FILE *_File);
  __attribute__ ((__dllimport__)) wint_t __attribute__((__cdecl__)) _ungetwc_nolock(wint_t _Ch,FILE *_File);
# 414 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/stdio.h" 3
  __attribute__ ((__dllimport__)) void __attribute__((__cdecl__)) _lock_file(FILE *_File);
  __attribute__ ((__dllimport__)) void __attribute__((__cdecl__)) _unlock_file(FILE *_File);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _fclose_nolock(FILE *_File);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _fflush_nolock(FILE *_File);
  __attribute__ ((__dllimport__)) size_t __attribute__((__cdecl__)) _fread_nolock(void *_DstBuf,size_t _ElementSize,size_t _Count,FILE *_File);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _fseek_nolock(FILE *_File,long _Offset,int _Origin);
  __attribute__ ((__dllimport__)) long __attribute__((__cdecl__)) _ftell_nolock(FILE *_File);
  __extension__ __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _fseeki64_nolock(FILE *_File,long long _Offset,int _Origin);
  __extension__ __attribute__ ((__dllimport__)) long long __attribute__((__cdecl__)) _ftelli64_nolock(FILE *_File);
  __attribute__ ((__dllimport__)) size_t __attribute__((__cdecl__)) _fwrite_nolock(const void *_DstBuf,size_t _Size,size_t _Count,FILE *_File);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _ungetc_nolock(int _Ch,FILE *_File);





  char *__attribute__((__cdecl__)) tempnam(const char *_Directory,const char *_FilePrefix);
  int __attribute__((__cdecl__)) fcloseall(void);
  FILE *__attribute__((__cdecl__)) fdopen(int _FileHandle,const char *_Format);
  int __attribute__((__cdecl__)) fgetchar(void);
  int __attribute__((__cdecl__)) fileno(FILE *_File);
  int __attribute__((__cdecl__)) flushall(void);
  int __attribute__((__cdecl__)) fputchar(int _Ch);
  int __attribute__((__cdecl__)) getw(FILE *_File);
  int __attribute__((__cdecl__)) putw(int _Ch,FILE *_File);
  int __attribute__((__cdecl__)) rmtmp(void);






#pragma pack(pop)

# 1 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/sec_api/stdio_s.h" 1 3
# 9 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/sec_api/stdio_s.h" 3
# 1 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/stdio.h" 1 3
# 10 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/sec_api/stdio_s.h" 2 3
# 449 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/stdio.h" 2 3

# 1 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/_mingw_print_pop.h" 1 3
# 451 "c:\\dwimperl\\c\\bin\\../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/include/stdio.h" 2 3
# 3 "main.c" 2



typedef struct {
    char *key;
    char *value;
} HashItem;

typedef struct {
    HashItem **items;
    int size;
    int count;
} HashTable;


int main(){

    HashTable *table = createTable();
    char *key = "key";
    char *val = "ACTVAL";
    insert(table, key, val);
    insert(table, key, "NEWWAL");
    insert(table, "anotherkey", "otherval");

    printf("table amount of values: %d \n", table->count);
    int i = 0;
    printf("table elements: \n");
    while(i < table->count){
        HashItem *item = table->items[i];
        printf("  key: '%s', value: '%s' \n", item->key, item->value);
        i++;
    }

    i = 0;
    while(i < table->count){
        free(table->items[i]);
        i++;
    }
    free(table->items);
    free(table);

    return 0;
}

void createTable(){
    HashTable *table = (HashTable*) malloc(sizeof(HashTable));
    table->size = 100;
    table->count = 0;
    table->items = (HashItem**) calloc(table->size, sizeof(HashItem*));
    return table;
}

void insert(HashTable *table, const char *key, const char *val){
    int i = 0;
    int count = table->count;
    while(i < count){
        HashItem *item = table->items[i];

        if(strcmp(item->key, key) == 0){
            item->value = val;
            return;
        }
        i++;
    }

    HashItem *item = (HashItem*) malloc(sizeof(HashItem));
    item->key = key;
    item->value = val;
    table->items[count] = item;
    table->count++;
}
