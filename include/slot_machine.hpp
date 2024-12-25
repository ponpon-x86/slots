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

    enum class MachineState {
        WAITING,
        SPINNING,
        AWARDING
    };

    template <typename StateType>
    void changeState(const std::vector<Reel>& reels);

    std::vector<Reel> getReels() const { return current_state->getReels(); };
    std::array<double, 3> getSpinCoefs() const { return current_state->getSpinCoefs(); };
    void stopReel(size_t index) { return current_state->stopReel(index); }; 

    std::vector<Reel::Symbol> getReelSymbols() const;

    MachineState getState() const;
private:
    std::unique_ptr<State> current_state;

    MachineState state;
};

// The definition of the template function
template <typename StateType>
void SlotMachine::changeState(const std::vector<Reel>& reels) {
    std::cout << "Transitioning to " << typeid(StateType).name() << "...\n";
    current_state.reset(new StateType(reels));

    std::string state_name = (std::string(typeid(StateType).name()));
    if (state_name == "Waiting") state = MachineState::WAITING;
    if (state_name == "Spinning") state = MachineState::SPINNING;
    if (state_name == "Awarding") state = MachineState::AWARDING;
}