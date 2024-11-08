#include <stdbool.h>
#include <stdio.h>

bool IsEven(int input)
{
    return input % 2 == 0;
}

int main(int argc, const char* argv[])
{
    if (argc > 0)
    {
        for (int arg_no = 0; arg_no < argc; ++arg_no)
        {
            printf("%s\n", argv[arg_no]);
        }
    }
    int counter = 0;
    for (int i = 0; i < 1000; ++i)
    {
        if (IsEven(i))
        {
            counter++;
            printf("counter = %d\n", counter);
        }
    }

    return 0;
}
