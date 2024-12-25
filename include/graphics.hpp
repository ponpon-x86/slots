#pragma once

#include <string>
#include <array>
#include <iostream>
#include <fstream>

#include "reel.hpp"

#include "SDL.h"
#include "SDL_image.h"

class Graphics {
private:
    static const int textures = 3;
public:
    Graphics();
    ~Graphics();

    void display(std::vector<Reel> reels);
    void delay() const;

    void pullLever();
    void pullLeverDown();
    void resetLever();

    void lightStopButton();
    void killStopButton();

    void handle_tokens(std::array<double, textures> coefs);

    SDL_Rect* getLeverRect();
    SDL_Rect* getStopButtonRect();
private:
    void init();
    void create();
    void loadTextures();
    void setRenderTarget(); // window is the target in this method
    
    Uint32 start;

    SDL_Renderer* renderer = nullptr;

    SDL_Window* window = nullptr;
    const int width = 640;
    const int height = 480;

    SDL_Texture* background = nullptr;
    SDL_Texture* plate = nullptr;

    struct Lever {
        std::array<SDL_Rect, textures> dst;
        std::array<SDL_Texture*, textures> textures = { nullptr, nullptr, nullptr };
        size_t state = 0;
    };

    struct Machine {
        std::array<SDL_Rect, textures> dst;
        std::array<SDL_Texture*, textures> textures = { nullptr, nullptr, nullptr };
        size_t state = 0;
    };
    SDL_Rect stop_button;

    struct Reels {
        SDL_Texture* reels = nullptr;
        SDL_Rect dst;
    };

    struct Shadows {
        SDL_Texture* shadows = nullptr;
        SDL_Rect dst;
    };

    Lever lever;

    Machine machine;

    Shadows shadows;

    Reels reels;

    SDL_Texture* star = nullptr;
    SDL_Texture* square = nullptr;
    SDL_Texture* circle = nullptr;
    const int token_dimensions = 133;
    const int reel_upper_border = 45;
    const int reel_lower_border = 415;
    int extended_reel_h;
    std::array<SDL_Rect, textures> reel_tokens;
};