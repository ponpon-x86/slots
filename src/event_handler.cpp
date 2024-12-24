#include "event_handler.hpp"
#include <iostream>

EventHandler::Event EventHandler::poll() {
    while(SDL_PollEvent(&event)) {
        switch(event.type) {
            case SDL_QUIT:
                return Event::QUIT;
            case SDL_KEYDOWN:
                switch(event.key.keysym.sym) {
                    case SDLK_ESCAPE:
                        return Event::QUIT;
                }
                break;
            case SDL_MOUSEMOTION:
                mouse.x = event.motion.x;
                mouse.y = event.motion.y;
                break;
            case SDL_MOUSEBUTTONDOWN:
                mouse.x = event.button.x;
                mouse.y = event.button.y;

                if (inLever()) return Event::LEVER_PULLED;
                if (inStopButton()) return Event::STOP_BUTTON_PRESSED;
                return Event::MOUSE_PRESSED;
        }
    }
    return Event::NOTHING;
}

bool EventHandler::inRect(const Point& mouse, const SDL_Rect* rect) const {
    std::cout << "inRect. Mouse: " << mouse.x << " " << mouse.y << ", rect: " << rect->x << " " << rect->y << " " << rect->w << " " << rect->h << "\n";

    if (
        mouse.x > rect->x &&
        mouse.x < rect->x + rect->w &&
        mouse.y > rect->y &&
        mouse.y < rect->y + rect->h
    ) return true;
    return false;
}

bool EventHandler::inLever() const {
    return inRect(mouse, lever_rect);
}

bool EventHandler::inStopButton() const {
    return inRect(mouse, stop_button_rect);
}