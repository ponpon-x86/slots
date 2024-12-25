#pragma once

#include <vector>
#include <array>
#include "reel.hpp"
#include "struct.h"

class State {
public:
    explicit State(const std::vector<Reel>& reels) : reels(reels) {}

    virtual ~State() {}

    virtual void handle() = 0;

    virtual void start() = 0;
    
    std::vector<Reel> getReels() const { return reels; };

    std::array<double, 3> getSpinCoefs() const { return spin_coefs; };

    void stopReel(size_t index) { spinning.at(index) = false; }; 

    StateContext getContext() { 
        StateContext context;
        context.reels = this->reels;
        context.spin_coefs = this->spin_coefs;
        context.spinning = this->spinning;
        context.spinning_speed = this->spinning_speed;
        context.velocity = this->velocity;
        return context;
    };

    void setContext(StateContext context) {
        this->reels = context.reels;
        this->spin_coefs = context.spin_coefs;
        this->spinning = context.spinning;
        this->spinning_speed = context.spinning_speed;
        this->velocity = context.velocity;
    }
protected:
    std::vector<Reel> reels;

    static const int reel_count = 3;
    
    std::array<double, reel_count> spin_coefs = { .5f, .5f, .5f };
    std::array<bool, reel_count> spinning = { false, false, false };

    double spinning_speed = 0.f;
    double max_speed = .1f;
    double velocity = 1.f;
    double max_velocity = 10.f;

    void resetSpeed() { 
        spinning_speed = 0.f;
        max_speed = .1f;
        velocity = 1.f;
        max_velocity = 10.f;
    };
private:
};