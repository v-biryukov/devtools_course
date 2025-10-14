#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
    FILE* fp = fopen("/mytimes.txt", "a");
    if (fp == NULL)
    {
        perror("Cannot open file");
        exit(1);
    }

    time_t t = time(NULL);
    fprintf(fp, "Hello, %ld seconds from 1970-01-01\n", (long)t);
    fclose(fp);
    return 0;
}
