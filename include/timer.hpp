#pragma once

#include <iostream>

class Timer {
public:
    Timer() = default;
    ~Timer() = default;

    enum class Event {
        LEVER_EXPIRED,
        MACHINE_EXPIRED,
        STOP_FIRST_TICK,
        STOP_SECOND_TICK,
        CORRECTION_FINISHED,
        AWARD,
        COUNTDOWN_FINISHED,
        NOTHING
    };

    Event handle();

    void startLeverTimer();
    void startMachineTimer();
    void startTwoStepTimer();
    void startCorrectionTimer();
    void startAwardTimer();

    void startCountdown();
    void stopCountdown();
private:
    struct Trigger {
        clock_t timer;
        bool activated = false;
    };

    Trigger lever;
    Trigger machine;
    std::pair<Trigger, Trigger> two_step;
    Trigger correction;
    Trigger award;
    Trigger countdown;
};