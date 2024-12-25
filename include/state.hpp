#pragma once

#include <vector>
#include <array>
#include "reel.hpp"

class State {
public:
    explicit State(const std::vector<Reel>& reels) : reels(reels) {}

    virtual ~State() {}

    virtual void handle() = 0;
    
    std::vector<Reel> getReels() const { return reels; };

    std::array<double, 3> getSpinCoefs() const { return spin_coefs; };

    void stopReel(size_t index) { spinning.at(index) = false; }; 
protected:
    std::vector<Reel> reels;

    static const int reel_count = 3;
    
    std::array<double, reel_count> spin_coefs = { .5f, .5f, .5f };
    std::array<bool, reel_count> spinning = { false, false, false };
private:
};