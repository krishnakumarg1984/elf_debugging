/* https://stackoverflow.com/a/28827188 */
/* https://stackoverflow.com/a/55860234 */

// This line **must** come **before** including <time.h> in order to bring in the
// POSIX functions such as `clock_gettime()`, `nanosleep()`, etc., from `<time.h>`!
#define _POSIX_C_SOURCE 199309L

#include <pthread.h>
#include <stdio.h>
#include <time.h>

void sleep_us(unsigned long microseconds)
{
    struct timespec ts;
    ts.tv_sec  = microseconds / 1000000ul;          // whole seconds
    ts.tv_nsec = (microseconds % 1000000ul) * 1000; // remainder, in nanoseconds
    nanosleep(&ts, NULL);
}

#define NTHREADS 10000

// Global variable
int counter = 0;

// Custom data type for a lock
// This lock, has exactly '1' key to it.
pthread_mutex_t fridgeLock = PTHREAD_MUTEX_INITIALIZER;

// Thread with variable arguments
void* thread(void* vargp)
{
    sleep_us(500);
    // I'm protecting the shared resource
    // (i.e. 'counter') with a lock that only
    // one thread at a time can access.
    pthread_mutex_lock(&fridgeLock);
    counter = counter + 1;
    pthread_mutex_unlock(&fridgeLock);

    return NULL;
}

int main()
{
    // Store our Pthread ID
    pthread_t tid[NTHREADS];
    // Create and execute the thread
    for (int i = 0; i < NTHREADS; i++)
    {
        pthread_create(&tid[i], NULL, thread, NULL);
    }
    for (int i = 0; i < NTHREADS; i++)
    {
        // Wait in 'main' thread until thread executes
        pthread_join(tid[i], NULL);
    }
    // Execute our main
    printf("Counter = %d\n", counter);

    return 0;
}
