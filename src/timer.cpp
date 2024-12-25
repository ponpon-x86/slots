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

void Timer::startTwoStepTimer() {
    two_step.first.activated = true;
    two_step.second.activated = true;
    if (two_step.first.activated) { 
        two_step.first.timer = clock();
    }
    if (two_step.second.activated) { 
        two_step.second.timer = clock();
    }
}

void Timer::startCorrectionTimer() {
    correction.activated = true;
    if (correction.activated) {
        correction.timer = clock();
    }
}

void Timer::startAwardTimer() {
    award.activated = true;
    if (award.activated) {
        award.timer = clock();
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

    if (two_step.first.activated) {
        if((double)(clock() - two_step.first.timer)/CLOCKS_PER_SEC >= 1) {
            two_step.first.activated = false;
            return Event::STOP_FIRST_TICK;
        }
    }

    if (two_step.second.activated) {
        if((double)(clock() - two_step.second.timer)/CLOCKS_PER_SEC >= 2) {
            two_step.second.activated = false;
            return Event::STOP_SECOND_TICK;
        }
    }

    if (correction.activated) {
        if((double)(clock() - correction.timer)/CLOCKS_PER_SEC >= 3) {
            correction.activated = false;
            return Event::CORRECTION_FINISHED;
        }
    }

    if (award.activated) {
        if((double)(clock() - award.timer)/CLOCKS_PER_SEC >= 5) {
            award.activated = false;
            return Event::AWARD;
        }
    }

    return Event::NOTHING;
}