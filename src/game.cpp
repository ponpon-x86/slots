#include "game.hpp"

Game::Game() {
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
        SDL_Window *window = SDL_CreateWindow(
            "SDL2Test",
            SDL_WINDOWPOS_UNDEFINED,
            SDL_WINDOWPOS_UNDEFINED,
            640,
            480,
            0
        );

        SDL_Renderer *renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_SOFTWARE);
        SDL_SetRenderDrawColor(renderer, 0, 0, 0, SDL_ALPHA_OPAQUE);
        SDL_RenderClear(renderer);
        SDL_RenderPresent(renderer);

        SDL_Delay(3000);

        SDL_DestroyWindow(window);

        running = false;
    }
}