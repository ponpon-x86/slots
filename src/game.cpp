#include "game.hpp"

Game::Game() :
slot_machine(std::make_unique<Waiting>(std::vector<Reel>{
    Reel({Reel::Symbol::STAR, Reel::Symbol::SQUARE, Reel::Symbol::CIRCLE}),
    Reel({Reel::Symbol::STAR, Reel::Symbol::SQUARE, Reel::Symbol::CIRCLE}),
    Reel({Reel::Symbol::STAR, Reel::Symbol::SQUARE, Reel::Symbol::CIRCLE})
})),
event_handler(this->graphics.getLeverRect(), this->graphics.getStopButtonRect()) {

    start();
}

Game::~Game() {
    
}

void Game::start() {
    run();
}

void Game::run() {
    while (running) {
        graphics.display(slot_machine.getReels());
        this->handle();
        slot_machine.handle();
        graphics.delay();
    }
}

void Game::handle() {
    auto game_event = event_handler.poll();
    switch(game_event) {
        case EventHandler::Event::QUIT:
            this->running = false;
            break;

        case EventHandler::Event::LEVER_PULLED:
            if(!this->stoppable) {
                graphics.pullLever();
                timer.startLeverTimer();
                slot_machine.changeState<Spinning>(slot_machine.getReels());
            }
            break;

        case EventHandler::Event::STOP_BUTTON_PRESSED:
            if (this->stoppable) {
                stoppable = false;
                stopped = true;
                timer.startMachineTimer();
                graphics.killStopButton();
                slot_machine.changeState<Awarding>(slot_machine.getReels());
            }
            break;

        case EventHandler::Event::MOUSE_PRESSED:
        case EventHandler::Event::NOTHING:
        default:
            break;
    }

    auto timer_event = timer.handle();
    switch (timer_event) {
        case Timer::Event::LEVER_EXPIRED:
            graphics.pullLeverDown();
            graphics.lightStopButton();
            this->stoppable = true;
            break;
        case Timer::Event::MACHINE_EXPIRED:
            graphics.resetLever();
            break;
        default:
            break;
    }
}