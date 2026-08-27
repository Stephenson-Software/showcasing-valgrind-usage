# Showcasing Valgrind usage
The project is intended to showcase how valgrind can be used to detect memory leaks.

## Requirements
`g++`, `make` and `valgrind`. The included dev container supplies all three: `.devcontainer/Dockerfile` installs valgrind, and `.devcontainer/devcontainer.json` grants the `SYS_PTRACE` capability that valgrind needs in order to run.

## Building and Running
```
make
./testing.exe
```
`make` compiles `src/testing.cpp` into `testing.exe`. `make clean` removes `testing.exe` and `valgrind-output.txt`.

## Running Under Valgrind
```
bash cr.sh
```
The script removes any old executable, runs `make`, and then runs `testing.exe` under valgrind, writing the report to `valgrind-output.txt`.

## Toggling the Leak
`Leaker::createStrings()` allocates 10,000 strings with `new` and never frees them. Uncommenting `// delete s;` at `src/testing.cpp:15` fixes the leak; commenting it out again restores it.

## Reference Output
Two captured valgrind runs are committed so that a reader can compare against them without running anything:

- `valgrind-output (leaking).txt` — the leak in place: `definitely lost: 320,000 bytes in 10,000 blocks` and `ERROR SUMMARY: 1 errors from 1 contexts`
- `valgrind-output (not leaking).txt` — `delete s;` uncommented: `All heap blocks were freed -- no leaks are possible` and `ERROR SUMMARY: 0 errors from 0 contexts`

Note that these filenames contain spaces and must be quoted when passed to a shell command.

## Valgrind Quick Start
https://valgrind.org/docs/manual/quick-start.html

## Memory Leak Fix PR in ACM Repository
https://github.com/CDOT-CV/asn1_codec/pull/7
