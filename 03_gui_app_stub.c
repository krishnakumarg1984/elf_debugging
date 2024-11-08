#include <stdbool.h> // For 'bool'
#include <stdint.h>  // For fixed-width types
#include <stdio.h>   // Input/Output

// Type definitions for function pointers
typedef void (*void_void)(void);

// Global Structures
struct _callback
{
    void_void Input;
} CallBack;

// Some 'dummy' functions
void glClear()
{
    // ...
}

void glSetClearColor(int32_t mask)
{
    // ...
}

void Flip()
{
    // ...
}

void SwapBuffers()
{
    // ...

    Flip(); // Call internal function
}

void InputHandler()
{
    printf("Processing input...\n");
}

void SetInputCallBack(void_void func)
{
    CallBack.Input = func;
}

typedef struct Data
{
    int SomeField;
} DataType;

typedef struct MatrixObject
{
    unsigned long id;
    const char* mName;
    DataType mData;
} MatrixObjectType;

// Entry point to program
int main()
{
    // Setup any callback functions from the global callback struct
    SetInputCallBack(InputHandler);

    MatrixObjectType object;
    object.id    = 1;
    object.mName = "UCL";

    // Main Application loop
    bool isRunning   = true;
    long long cycles = 0;
    while (isRunning)
    {
        // Process user input
        CallBack.Input();

        // Setup stateful machine
        glClear();
        glSetClearColor((int32_t)0xAABBCCFF);

        // swap front and back buffer
        SwapBuffers();
        // Increment internal cycle counter
        ++cycles;

        // another function call to Flip()
        Flip();
        // Print out cycle number
        printf("cycle number:%lld \n", cycles);
    }

    return 0;
}
