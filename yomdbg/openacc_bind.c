#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <ctype.h>
#include <stdarg.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#ifdef _OPENACC
#include <openacc.h>
#include <accel.h>
#endif

#define OPENACC_BIND_TXT "openacc_bind.txt"

static int DEVNUM = -1;
static int MPIRANK = -1;

void openacc_bind_ (int * prank, int * psize)
{
  int rank = *prank;
  FILE * fp;
  int i;
  size_t len  = 256;
  char * buf = (char*)malloc (len);
  const char * MF_OPENACC_BIND;
  int idev;

  MPIRANK = *prank;

  MF_OPENACC_BIND = getenv ("MF_OPENACC_BIND");

  if (MF_OPENACC_BIND == NULL)
    MF_OPENACC_BIND = OPENACC_BIND_TXT;

  fp = fopen (MF_OPENACC_BIND, "r");

  if (fp == NULL)
    {
      fprintf (stderr, "`%s' was not found\n", MF_OPENACC_BIND);
      goto end;
    }

  for (i = 0; i < rank+1; i++)
    {
      if (getline (&buf, &len, fp) == -1)
        {
          fprintf (stderr, "Unexpected EOF while reading `" OPENACC_BIND_TXT "'\n");
          goto end;
        }
    }

  if (sscanf (buf, "%d", &idev) != 1)
    {
      fprintf (stderr, "Expected INTEGER while reading `" OPENACC_BIND_TXT "'\n");
      goto end;
    }

#ifdef _OPENACC
  printf (" openacc_bind_ : %d -> %d\n", rank, idev);
  acc_set_device_num (idev, acc_device_nvidia);
  DEVNUM = idev;
#endif

end:

  if (fp != NULL)
    fclose (fp);

  free (buf);
}

static int runCommand (const char * fmt, ...)
{
  char command[512];
  va_list ap;
  int count;
  int rc;

  va_start (ap, fmt);
  count = vsnprintf (command, sizeof (command), fmt, ap);
  va_end (ap);

  if (count >= sizeof (command))
    abort ();

  rc = system (command);

  if (rc)
    abort ();
}

void nvidia_smi_ (ssize_t * psize)
{
  char file[64];
  FILE * fp = NULL;

  *psize = -1;

#ifdef _OPENACC
  if (DEVNUM >= 0)
    {
      sprintf (file, ".nvidia-smi-%6.6d.txt", MPIRANK);
      unlink (file);
      runCommand ("/usr/bin/nvidia-smi --query-compute-apps=used_memory  --format=csv,noheader,nounits -i %d > %s", DEVNUM, file);
      if (fp = fopen (file, "r"))
        {
          fscanf (fp, "%lld", psize);
          fclose (fp);
        }
   }
#endif

}

void nvidia_free_memory_ (ssize_t * psize)
{
  *psize = 0;
#ifdef _OPENACC
  *psize = acc_get_memory () - acc_get_free_memory ();
#endif
}

static int redirectStderr (const char * file)
{
  int i, j, k;

  unlink (file);
  k = open (file, O_WRONLY | O_CREAT, 0644);

  fflush (stderr);
  i = fileno (stderr);
  j = dup (i);
  dup2 (k, i);
  return j;
}

static void restoreStderr (int j)
{
  fflush (stderr);
  dup2 (j, 2);
  close (j);
}

void nvidia_present_dump_ (ssize_t * pallocated, ssize_t * pdeleted)
{
  int i;
  char file[64];
  FILE * fp = NULL;
  size_t linesize = 0;
  char * line = NULL;
  const char * ALLOCATED_BLOCK = "allocated block ";
  const char * DELETED_BLOCK = "deleted block ";
  const char * SIZE = "size:";

  *pallocated = 0;
  *pdeleted   = 0;

#ifdef _OPENACC

  sprintf (file, ".nvidia-acc_present_dump-%6.6d.txt", MPIRANK);
  unlink (file);

  i = redirectStderr (file);
  acc_present_dump ();
  restoreStderr (i);

  fp = fopen (file, "r");

  while (getline (&line, &linesize, fp) >= 0)
    {
      if (strncmp (line, ALLOCATED_BLOCK, strlen (ALLOCATED_BLOCK)) == 0)
        {
          const char * str = strstr (line, SIZE);
          size_t size;
          if (str)
            {
              str += strlen (SIZE);
              sscanf (str, "%lld", &size);
              *pallocated += size;
            }
        }
      else if (strncmp (line, DELETED_BLOCK, strlen (DELETED_BLOCK)) == 0)
        {
          const char * str = strstr (line, SIZE);
          size_t size;
          if (str)
            {
              str += strlen (SIZE);
              sscanf (str, "%lld", &size);
              *pdeleted += size;
            }
        }
    }

  free (line);

  fclose (fp);

#endif

}

