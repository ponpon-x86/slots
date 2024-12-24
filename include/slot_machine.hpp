#pragma once

#include <iostream>

#include "state.hpp"
#include "graphics.hpp"

class SlotMachine {
public:
    explicit SlotMachine(std::unique_ptr<State> initial) 
        : current_state(std::move(initial)) {};
    ~SlotMachine() = default;

    void handle();

    template <typename StateType>
    void changeState(const std::vector<Reel>& reels);

    std::vector<Reel> getReels() { return current_state->getReels(); };
private:
    std::unique_ptr<State> current_state;
};

// The definition of the template function
template <typename StateType>
void SlotMachine::changeState(const std::vector<Reel>& reels) {
    std::cout << "Transitioning to " << typeid(StateType).name() << "...\n";
    current_state.reset(new StateType(reels));
}