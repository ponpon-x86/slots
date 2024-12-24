#include "event_handler.hpp"

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
        }
    }
    return Event::NOTHING;
}