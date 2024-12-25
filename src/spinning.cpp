#include "spinning.hpp"

void Spinning::correction() {
    for (int i = 0; i < reel_count; ++i) {
        if (spinning.at(i) == false) {
            double correction_coef = .1f;
            if (fabs(spin_coefs.at(i) - .5f) < .25f)
                correction_coef = .05f;
            if (fabs(spin_coefs.at(i) - .5f) < .15f)
                correction_coef = .03f;
            if (fabs(spin_coefs.at(i) - .5f) < .10f)
                correction_coef = .01f;
            if (fabs(spin_coefs.at(i) - .5f) < .05f)
                correction_coef = .005f;
            if (fabs(spin_coefs.at(i) - .5f) < .01f)
                correction_coef = .00005f;
                
            if (spin_coefs.at(i) > .5f) {
                correction_coef *= (-1);
            }

            spin_coefs.at(i) += correction_coef;
        }
    }
}

void Spinning::handle() {
    correction();

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