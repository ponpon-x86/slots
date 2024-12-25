#pragma once

#include <iostream>
#include "slot_machine.hpp"
#include "graphics.hpp"
#include "event_handler.hpp"
#include "timer.hpp"

#include "waiting.hpp"
#include "spinning.hpp"
#include "awarding.hpp"

#include "reel.hpp"

#include "SDL.h"

class Game {
public:
    Game();
    ~Game();
    void start();
private:
    SlotMachine slot_machine;
    Graphics graphics;
    EventHandler event_handler;
    Timer timer;

    bool running = true;
    bool stoppable = false;
    bool stopped = false;

    enum ReelIndex {
        FIRST,
        SECOND,
        THIRD
    };

    void run();

    void handle();
};