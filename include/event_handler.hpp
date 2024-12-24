#pragma once

#include "struct.h"
#include "SDL.h"

class EventHandler {
public:
    explicit EventHandler(SDL_Rect* lever, SDL_Rect* stop_button)
        : lever_rect(lever), stop_button_rect(stop_button) {};
    ~EventHandler() = default;

    enum class Event {
        NOTHING,
        MOUSE_PRESSED,
        LEVER_PULLED,
        STOP_BUTTON_PRESSED,
        QUIT
    };

    Event poll();
private:
    SDL_Event event;
    Point mouse;

    SDL_Rect* lever_rect;
    SDL_Rect* stop_button_rect;

    bool inRect(const Point& mouse, const SDL_Rect* rect) const;

    bool inLever() const;
    bool inStopButton() const;
};