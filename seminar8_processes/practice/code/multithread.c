#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

#define NUM_THREADS 5

void* counter(void* arg) 
{
    int id = *(int*)arg;
    int i = 0;
    while (1)
    {
        printf("Thread %2i: %i\n", id, i);
        sleep(1);
        i++;
    }
    return NULL;
}

int main()
{
    pthread_t tid[NUM_THREADS];
    int ids[NUM_THREADS];

    for (int i = 0; i < NUM_THREADS; i++)
    {
        ids[i] = i + 1;
        if (pthread_create(&tid[i], NULL, counter, &ids[i]) != 0)
        {
            perror("pthread_create");
            exit(1);
        }
    }

    for (int i = 0; i < NUM_THREADS; i++)
        pthread_join(tid[i], NULL);

    printf("All threads finished.\n");
}