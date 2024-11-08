#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int main()
{
    int x = 1;

    pid_t pid = fork();
    if (pid == 0)
    {
        printf("child: x=%d\n", ++x);
        return 0;
    }

    // Parent
    printf("parent: x=%d\n", --x);

    return 0;
}
