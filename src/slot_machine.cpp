#include "slot_machine.hpp"

void SlotMachine::handle() {
    current_state->handle();
    for (auto& reel : current_state->getReels())
        std::cout << reel << "\n";
}

std::vector<Reel::Symbol> SlotMachine::getReelSymbols() const {
    std::vector<Reel::Symbol> syms;
    for (auto& reel : current_state->getReels()) {
        syms.push_back(reel.getSymbol());
    }
    return syms;
}