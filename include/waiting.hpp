#pragma once

#include <iostream>
#include "state.hpp"

class Waiting : public State {
public:
    explicit Waiting(const std::vector<Reel>& reels) : State(reels) {}

    void handle() override;
private:
};