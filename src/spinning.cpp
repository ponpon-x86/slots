#include "spinning.hpp"

void Spinning::handle() {
    for(int i = 0; i < reel_count; ++i) {
        if(spinning.at(i)) {
            spin_coefs.at(i) += .1f;
        }
    }

    for (auto& coef : spin_coefs) {
        if (fabs(1. - coef) < 0.0000f) {
            for (auto& reel : reels) {
                reel.spin();
            }
        }
    }
    
    std::cout << "State: Spinning...\n";
}