#pragma once

#include "SDL.h"

class EventHandler {
public:
    EventHandler() = default;
    ~EventHandler() = default;

    enum class Event {
        NOTHING,
        QUIT
    };

    Event poll();
private:
    SDL_Event event;
};