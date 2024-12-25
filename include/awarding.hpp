#pragma once

#include <iostream>
#include "state.hpp"

class Awarding : public State {
public:
    explicit Awarding(const std::vector<Reel>& reels) : State(reels) {}

    void handle() override;
    
    void start() override {};
private:
};