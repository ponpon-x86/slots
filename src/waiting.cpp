#include "waiting.hpp"

void Waiting::handle() {
    std::cout << "State: Waiting...\n";
}

void Waiting::start() {
    for(auto& spin : spinning) { 
        spin = true;
    }
}