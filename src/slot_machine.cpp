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

SlotMachine::MachineState SlotMachine::getState() const {
    return state;
}

void SlotMachine::setContext(StateContext context) {
    current_state->setContext(context);
}

bool SlotMachine::victoryCheck() const {
    std::vector<Reel::Symbol> syms;
    for (auto& reel : getReels()) {
        syms.push_back(reel.getSymbol());
    }
    Reel::Symbol symbol = syms.front();
    for (auto& sym : syms) {
        if (symbol != sym) return false;
    }
    return true;
}