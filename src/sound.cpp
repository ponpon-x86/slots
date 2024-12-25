#include "sound.hpp"

void Sound::init() {
    if ( Mix_OpenAudio( 22050, MIX_DEFAULT_FORMAT, 2, 4096 ) == -1 ) {
        std::cout << "\tSDL_Mixer: failed to initialized.\n";
    }
}

void Sound::loadChunks() {
    win = Mix_LoadWAV("../../assets/sound/win.wav");
    loss = Mix_LoadWAV("../../assets/sound/loss.wav");

    if (win == nullptr) {
        std::cout << "\tFailed to load sound: win.wav.\n";
    }

    if (loss == nullptr) {
        std::cout << "\tFailed to load sound: loss.wav.\n";
    }

    pull.first = Mix_LoadWAV("../../assets/sound/pull_0.wav");
    pull.second = Mix_LoadWAV("../../assets/sound/pull_1.wav");
    
    if (pull.first == nullptr) {
        std::cout << "\tFailed to load sound: pull_0.wav.\n";
    }
    
    if (pull.second == nullptr) {
        std::cout << "\tFailed to load sound: pull_1.wav.\n";
    }
    
    stop.first = Mix_LoadWAV("../../assets/sound/stop_0.wav");
    stop.second = Mix_LoadWAV("../../assets/sound/stop_1.wav");
    
    if (stop.first == nullptr) {
        std::cout << "\tFailed to load sound: stop_0.wav.\n";
    }
    
    if (stop.second == nullptr) {
        std::cout << "\tFailed to load sound: stop_1.wav.\n";
    }
}

void Sound::playWinSound() {
    Mix_PlayChannel(-1, win, 0);
}

void Sound::playLossSound() {
    Mix_PlayChannel(-1, loss, 0);
}

void Sound::playInitialPullSound() {
    Mix_PlayChannel(-1, pull.first, 0);
}

void Sound::playFullPullSound() {
    Mix_PlayChannel(-1, pull.second, 0);
}

void Sound::playManualStopSound() {
    Mix_PlayChannel(-1, stop.first, 0);
}

void Sound::playAutoStopSound() {
    Mix_PlayChannel(-1, stop.second, 0);
}

Sound::Sound() {
    init();
    loadChunks();
}

Sound::~Sound() {
    Mix_FreeChunk(win);
    Mix_FreeChunk(loss);
    Mix_FreeChunk(pull.first);
    Mix_FreeChunk(pull.second);
    Mix_FreeChunk(stop.first);
    Mix_FreeChunk(stop.second);

    Mix_CloseAudio();
}