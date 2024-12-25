#include "spinning.hpp"

void Spinning::handle() {
    // should this be here?
    for (auto& spin : spinning) {
        spin = true;
    }

    spinning_speed = log(velocity) / 10;
    if (spinning_speed > max_speed) {
        spinning_speed = max_speed;
    }
    
    for (int i = 0; i < reel_count; ++i) {
        if(spinning.at(i)) {
            spin_coefs.at(i) += spinning_speed;
        }
    }

    for (int i = 0; i < reel_count; ++i) {
        if (1. - spin_coefs.at(i) < 0.00001f) {
            reels.at(i).spin();
            spin_coefs.at(i) = 0;
        }
    }

    // since the simulation runs at 30 fps
    // we should reach max. vel and spd in
    // less than a second
    velocity += 0.1f;
    if (velocity > max_velocity) {
        velocity = max_velocity;
    }
    
    std::cout << "State: Spinning...\n";
}

/*
void Spinning::startReels() {
    std::cout << "Tried to start the reels. The reels are already spinning.\n";
}
*/