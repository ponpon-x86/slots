#pragma once

#include <vector>
#include "reel.hpp"

class State {
public:
    explicit State(const std::vector<Reel>& reels) : reels(reels) {}

    virtual ~State() {}

    virtual void handle() = 0;
    
    std::vector<Reel> getReels() { return reels; };
protected:
    std::vector<Reel> reels;
private:
};