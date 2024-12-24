#include "slot_machine.hpp"

void SlotMachine::handle() {
    current_state->handle();
    for (auto& reel : current_state->getReels())
        std::cout << reel << "\n";
}