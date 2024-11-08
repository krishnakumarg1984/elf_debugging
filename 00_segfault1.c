#include <stdio.h>
#include <sys/ptrace.h>
#include <unistd.h>

int main()
{
    /*
    if (ptrace(PTRACE_TRACEME, 0, NULL, 0) == -1)
    {
        printf("%s", "I am a debugee!\n");
    }
    */

    /*
    int x = 0;
    int* p = &x;
    */

    int* p = 0;

    printf("Hello UCL-ARC!\n");
    sleep(1);
    printf("Let us talk about an important HPC topic\n");
    sleep(1);
    printf("*Hint* it's about debugging\n");
    sleep(1);

    /* a few other
       lines and
       blocks of code */

    /* more such
       lines and
       blocks of code */

    *p = 7;

    return 0;
}
