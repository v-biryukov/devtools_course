#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() 
{
    pid_t pid = fork();
    if (pid > 0) 
    {
        sleep(1000);
    } 
    else if (pid == 0) 
    {
        exit(0);
    }
}
