#pragma once

#include <vector>
#include <array>
#include "reel.hpp"

struct Point
{
    int x;
    int y;
};

struct StateContext
{
    std::vector<Reel> reels;

    static const int reel_count = 3;
    
    std::array<double, reel_count> spin_coefs = { .5f, .5f, .5f };
    std::array<bool, reel_count> spinning = { false, false, false };

    double spinning_speed = 0.f;
    double velocity = 1.f;
};
