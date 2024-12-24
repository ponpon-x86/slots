#include "game.hpp"

Game::Game() :
slot_machine(std::make_unique<Waiting>(std::vector<Reel>{
    Reel({Reel::Symbol::STAR, Reel::Symbol::SQUARE, Reel::Symbol::CIRCLE}),
    Reel({Reel::Symbol::STAR, Reel::Symbol::SQUARE, Reel::Symbol::CIRCLE}),
    Reel({Reel::Symbol::STAR, Reel::Symbol::SQUARE, Reel::Symbol::CIRCLE})
})) {
    SDL_Init(SDL_INIT_VIDEO);

    start();
}

Game::~Game() {
    SDL_Quit();
}

void Game::start() {
    run();
}

void Game::run() {
    while (running) {
        
        slot_machine.handle();

        slot_machine.changeState<Spinning>(slot_machine.getReels());

        slot_machine.handle();

        slot_machine.changeState<Awarding>(slot_machine.getReels());

        slot_machine.handle();

        slot_machine.changeState<Waiting>(slot_machine.getReels());

        slot_machine.handle();

        running = false;
    }
}