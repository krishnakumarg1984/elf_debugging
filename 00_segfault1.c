#include <stdio.h>
#include <unistd.h>

int main()
{
    printf("Hello UCL-ARC!\n");
    sleep(1);
    printf("Let us talk about an important HPC topic\n");
    sleep(1);
    printf("*Hint* it's about debugging\n");
    sleep(1);
    /* int x = 0; */
    /* int* p = &x; */
    int* p = NULL;
    *p     = 7;

    return 0;
}
