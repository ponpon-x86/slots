#include "game.hpp"

Game::Game() :
slot_machine(std::make_unique<Waiting>(std::vector<Reel>{
    Reel({Reel::Symbol::STAR, Reel::Symbol::SQUARE, Reel::Symbol::CIRCLE}),
    Reel({Reel::Symbol::STAR, Reel::Symbol::SQUARE, Reel::Symbol::CIRCLE}),
    Reel({Reel::Symbol::STAR, Reel::Symbol::SQUARE, Reel::Symbol::CIRCLE})
})) {

    start();
}

Game::~Game() {
    
}

void Game::start() {
    run();
}

void Game::run() {
    while (running) {
        graphics.display();
        handle();
        graphics.delay();
    }
}

void Game::handle() {
    auto polled = event_handler.poll();
    switch(polled) {
        case EventHandler::Event::QUIT:
        this->running = false;

        case EventHandler::Event::NOTHING:
        default:
        break;
    }
}