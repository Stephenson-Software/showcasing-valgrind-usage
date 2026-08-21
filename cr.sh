#!/bin/bash

# remove old executable
rm -f testing.exe

# compile
make

# run
valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind-output.txt ./testing.exe
