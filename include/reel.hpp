#pragma once

#include <deque>
#include <random>
#include <iostream>

class Reel {
public:
    enum class Symbol {
        SQUARE,
        CIRCLE,
        STAR  
    };

    explicit Reel(std::deque<Symbol> symbols) : symbols(symbols) {
        std::random_device rd;
        std::mt19937 f(rd());

        std::shuffle(this->symbols.begin(), this->symbols.end(), f);
    };

    friend std::ostream& operator<<(std::ostream& os, const Reel& r)
    {
        os << " { ";
        for(auto& sym : r.symbols) {
            switch (sym) {
                case Reel::Symbol::STAR:
                os << "star";
                break;
                case Reel::Symbol::CIRCLE:
                os << "circle";
                break;
                case Reel::Symbol::SQUARE:
                os << "square";
                break;
            }
            os << " ";
        }
        os << "} ";
        return os;
    }

    Symbol spin();

    Symbol getSymbol();
private:
    std::deque<Symbol> symbols;
};