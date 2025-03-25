#define _GNU_SOURCE
#include <dlfcn.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <stdio.h>
#include <execinfo.h>
#include <malloc.h>
#include <sys/types.h>
#include <unistd.h>


static void * (*__for_allocate) (size_t, void **, void **) = NULL;
static void * (*__for_dealloc_allocatable) (void **, void **) = NULL;

static unsigned char snan8[] = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf4, 0x7f };
static unsigned char cinit[] = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
static unsigned char zero0[] = { 0x00 };
static unsigned char * init = NULL;
static int sizeof_init = 0;

static void init_ ()
{
  const char * FOR_ALLOCATE_INIT  = getenv ("FOR_ALLOCATE_INIT");
  if (FOR_ALLOCATE_INIT)
    {
      if (strcasecmp (FOR_ALLOCATE_INIT, "NAN") == 0)
        {
          init = &snan8[0];
          sizeof_init = sizeof (snan8);
        }
      else if (strcasecmp (FOR_ALLOCATE_INIT, "ZERO") == 0)
        {
          init = &zero0[0];
          sizeof_init = sizeof (zero0);
        }
      else if (strncasecmp (FOR_ALLOCATE_INIT, "0X", 2) == 0)
        {
          long long unsigned int x = 0;
	  const char * c;
          for (c = FOR_ALLOCATE_INIT+2; *c; c++)
            if (('0' <= *c) && (*c <= '9'))
              x = 16 * x + (*c - '0');
	    else if (('a' <= *c) && (*c <= 'f'))
              x = 16 * x + (*c - 'a' + 10);
	    else if (('A' <= *c) && (*c <= 'F'))
              x = 16 * x + (*c - 'A' + 10);
            else
              break;
          init = &cinit[0];
	  memcpy (cinit, &x, sizeof (x));
          sizeof_init = sizeof (cinit);
        }
      printf (" FOR_ALLOCATE_INIT = %s\n", FOR_ALLOCATE_INIT);
    }
  __for_allocate = dlsym (RTLD_NEXT, "for_allocate");
  __for_dealloc_allocatable = dlsym (RTLD_NEXT, "for_dealloc_allocatable");
}

#define init() do { if (__for_allocate == NULL) init_ (); } while (0)

void * Xfor_allocate (size_t size, void ** pptr, void * flag)
{
  init ();
  void * ret = __for_allocate (size, pptr, flag);

  {
    unsigned char * c = *pptr;
    int i;
    if (init && c)
      for (i = 0; i < size; i++)
        c[i] = init[i%sizeof_init];
  }

  return ret;
}

void * Xfor_dealloc_allocatable (void * ptr, void * flag)
{
  init ();
  void * ret = __for_dealloc_allocatable (ptr, flag);
  return ret;
}

