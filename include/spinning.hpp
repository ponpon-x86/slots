#pragma once

#include <iostream>
#include <array>
#include "state.hpp"

class Spinning : public State {
public:
    explicit Spinning(const std::vector<Reel>& reels) : State(reels) {}

    void handle() override;

    void start() override {};
private:
};