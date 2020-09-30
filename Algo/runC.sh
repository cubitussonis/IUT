#!/bin/bash

gcc -Wall -o "$1.o" -c "$1.c"
gcc -o $1 "$1.o"
./$1
