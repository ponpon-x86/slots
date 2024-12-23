#pragma once

#include <iostream>
#include "slot_machine.hpp"
#include "graphics.hpp"
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