#ifdef __NEC__
void bt_() { }
#else
#include <execinfo.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>


void bt_ ()
{
#define SIZE 100
  void *buffer[SIZE]; 
  int nptrs;

  nptrs = backtrace (buffer, SIZE);

  backtrace_symbols_fd (buffer, nptrs, STDERR_FILENO);
  
}
#endif

