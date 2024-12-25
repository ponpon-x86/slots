#pragma once

#include <iostream>

#include "SDL.h"
#include "SDL_mixer.h"

class Sound {
public:
    Sound();
    ~Sound();

    void playWinSound();
    void playLossSound();
    void playInitialPullSound();
    void playFullPullSound();
    void playManualStopSound();
    void playAutoStopSound();
private:
    void init();
    void loadChunks();

    Mix_Chunk* win = nullptr;
    Mix_Chunk* loss = nullptr;
    std::pair<Mix_Chunk*, Mix_Chunk*> pull = { nullptr, nullptr };
    std::pair<Mix_Chunk*, Mix_Chunk*> stop = { nullptr, nullptr };
};