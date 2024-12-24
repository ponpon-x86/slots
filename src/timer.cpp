#include "timer.hpp"

void Timer::startLeverTimer() {
    lever.activated = true;
    if (lever.activated) {
        lever.timer = clock();
    }
}

void Timer::startMachineTimer() {
    machine.activated = true;
    if (machine.activated) {
        machine.timer = clock();
    }
}

Timer::Event Timer::handle() {
    if (lever.activated) {
        if((double)(clock() - lever.timer)/CLOCKS_PER_SEC >= 1) {
            lever.activated = false;
            return Event::LEVER_EXPIRED;
        }
    }

    if (machine.activated) {
        if((double)(clock() - machine.timer)/CLOCKS_PER_SEC >= 1) {
            machine.activated = false;
            return Event::MACHINE_EXPIRED;
        }
    }

    return Event::NOTHING;
}