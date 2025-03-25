#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <string.h>
#include <sys/types.h>


static void sigint_sigaction (int signal, siginfo_t * siginfo, void * context)
{
  printf ("Process %d (father %d) got signal %d from process %d owned by %d\n", 
          getpid (), getppid (), signal, siginfo->si_pid, siginfo->si_uid);
  system ("ps -f -u marguina");
}

void setsigaction_ ()
{
  pid_t pid;
  struct sigaction newact, oldact;

  memset (&newact, sizeof (newact), 0);
  memset (&oldact, sizeof (oldact), 0);

  newact.sa_sigaction = sigint_sigaction;
  newact.sa_flags     = SA_SIGINFO;

  sigaction (SIGINT, &newact, &oldact);
}

