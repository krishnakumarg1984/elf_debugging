#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

// Fixed-data encoding a message
static char message[] = { 0x54, 0x68, 0x61, 0x6e, 0x6b, 0x20, 0x79, 0x6f, 0x75, 0x2c,
                          0x20, 0x55, 0x43, 0x4c, 0x2d, 0x41, 0x52, 0x43, 0x21 };

// Greeting routine
void greeting()
{
    printf("Hello UCL-ARC!\n");
    sleep(1);

    printf("Let us talk about an important HPC topic\n");
    sleep(1);

    printf("*Hint* it's about debugging\n");
    sleep(1);
}

// Entry point to program
int main()
{

    // Greeting message
    greeting();

    // Show the special message
    char* p = NULL;
    p = malloc(sizeof(message));
    strcpy(p, message);
    printf("%s\n", p);

    free(p);

    return 0;
}
