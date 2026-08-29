#include <string>
#include <iostream>

class Leaker {
    public:
        void createStrings() {
            int numStrings = 10000;
            std::cout << "Creating " << numStrings << " strings..." << std::endl;
            // cause a memory leak
            for (int i = 0; i < numStrings; i++) {
                std::string* s = new std::string("string #" + std::to_string(i));
                std::cout << *s << std::endl;

                // uncomment this line to fix the memory leak
                // delete s;
            }
            std::cout << numStrings << " strings created!" << std::endl;
        }
};

int main() {
    Leaker leaker;
    leaker.createStrings();
    return 0;
}