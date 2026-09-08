#!/bin/bash

# stop as soon as a step fails, so a compile error is not scrolled past
set -e

# make sure valgrind is installed before anything is built
if ! command -v valgrind > /dev/null; then
    echo "valgrind was not found on this machine." >&2
    echo "The dev container in .devcontainer/ installs valgrind and grants the SYS_PTRACE capability it needs." >&2
    exit 1
fi

# remove old executable
rm -f testing.exe

# compile
make

# run
valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind-output.txt ./testing.exe
