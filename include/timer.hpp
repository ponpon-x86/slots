#pragma once

#include <iostream>

class Timer {
public:
    Timer() = default;
    ~Timer() = default;

    enum class Event {
        LEVER_EXPIRED,
        MACHINE_EXPIRED,
        NOTHING
    };

    Event handle();

    void startLeverTimer();
    void startMachineTimer();
private:
    struct Tirgger {
        clock_t timer;
        bool activated;
    };

    Tirgger lever;
    Tirgger machine;
};