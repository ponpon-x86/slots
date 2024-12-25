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
        slot_machine.handle();
        graphics.handle_tokens(slot_machine.getSpinCoefs());
        graphics.display(slot_machine.getReels());
        this->handle();
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
            slot_machine.start();
            if(!this->lever_forbidden) {
                this->lever_forbidden = true;
                graphics.pullLever();
                sound.playInitialPullSound();
                timer.startLeverTimer();

                auto context = slot_machine.getContext();
                slot_machine.changeState<Spinning>(slot_machine.getReels());
                slot_machine.setContext(context);
            }
            break;

        case EventHandler::Event::STOP_BUTTON_PRESSED:
            if (!this->stop_button_forbidden) {
                this->stop_button_forbidden = true;
                sound.playManualStopSound();
                timer.startMachineTimer();
                graphics.killStopButton();
                timer.startTwoStepTimer();
                timer.stopCountdown();
                slot_machine.stopReel(ReelIndex::FIRST);
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
            sound.playFullPullSound();
            graphics.lightStopButton();
            timer.startCountdown();
            this->stop_button_forbidden = false;
            break;
        case Timer::Event::MACHINE_EXPIRED:
            break;
        case Timer::Event::STOP_FIRST_TICK:
            slot_machine.stopReel(ReelIndex::SECOND);
            sound.playManualStopSound();
            break;
        case Timer::Event::STOP_SECOND_TICK:
            slot_machine.stopReel(ReelIndex::THIRD);
            sound.playManualStopSound();
            timer.startCorrectionTimer();
            break;
        case Timer::Event::CORRECTION_FINISHED:
        {
            timer.startAwardTimer();
            if (slot_machine.victoryCheck()) {
                sound.playWinSound();
                graphics.lightMachine();
            } else {
                sound.playLossSound();
            }

            auto context = slot_machine.getContext();
            slot_machine.changeState<Awarding>(slot_machine.getReels());
            slot_machine.setContext(context);
            break;
        }
        case Timer::Event::COUNTDOWN_FINISHED:
            sound.playAutoStopSound();
            // forbidden
            sound.playManualStopSound();
            timer.startMachineTimer();
            graphics.killStopButton();
            timer.startTwoStepTimer();
            slot_machine.stopReel(ReelIndex::FIRST);
            this->stop_button_forbidden = true;
            break;
        case Timer::Event::AWARD:
        {
            graphics.resetLever();
            graphics.killMachineLight();

            auto context = slot_machine.getContext();
            slot_machine.changeState<Waiting>(slot_machine.getReels());
            slot_machine.setContext(context);
            this->lever_forbidden = false;
            break;
        }
        default:
            break;
    }
}