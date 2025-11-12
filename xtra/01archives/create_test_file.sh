#!/bin/bash

filename=${1:-result.txt}
nbytes=${2:-1000}
maxblocksize=${3:-50}

awk -v nbytes="$nbytes" -v maxblocksize="$maxblocksize" 'BEGIN {
    srand();
    i = 0;
    while (i < nbytes)
    {
        c = sprintf("%c", int(33 + rand() * 94));
        n = int(1 + rand() * maxblocksize);
        if (n > (nbytes - i))
            n = nbytes - i;
        for (j = 0; j < n; j++)
            printf "%s", c;
        i += n;
    }
}' > $filename
