.PHONY: all clean

all: testing.exe

testing.exe: src/testing.cpp
	@echo "---"
	@echo "Compiling testing.cpp"

	g++ src/testing.cpp -o testing.exe

	@echo "Finished compiling testing.cpp"

clean:
	@echo "---"
	@echo "Removing build output"

	rm -f testing.exe valgrind-output.txt

	@echo "Finished removing build output"
