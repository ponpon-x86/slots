#pragma once

#include <iostream>
#include "slot_machine.hpp"
#include "graphics.hpp"

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

    bool running = true;

    void run();
};