#include "reel.hpp"

Reel::Symbol Reel::spin() {
    auto sym = symbols.front();
    symbols.pop_front();
    symbols.push_back(sym);
    return sym;
}

Reel::Symbol Reel::getSymbol() {
    return this->symbols.front();
}