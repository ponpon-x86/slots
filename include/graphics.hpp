#pragma once

#include <string>
#include <array>
#include <iostream>
#include <fstream>

#include "reel.hpp"

#include "SDL.h"
#include "SDL_image.h"

class Graphics {
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

    static const int textures = 3;

    struct Lever {
        std::array<SDL_Rect, textures> dst;
        std::array<SDL_Texture*, textures> textures = { nullptr };
        size_t state = 0;
    };

    struct Machine {
        std::array<SDL_Rect, textures> dst;
        std::array<SDL_Texture*, textures> textures = { nullptr };
        size_t state = 0;
    };
    SDL_Rect stop_button;

    struct Shadows {
        SDL_Texture* shadows = nullptr;
        SDL_Rect dst;
    };

    Lever lever;

    Machine machine;

    Shadows shadows;

    SDL_Texture* star = nullptr;
    SDL_Texture* square = nullptr;
    SDL_Texture* circle = nullptr;
    const int token_dimensions = 133;
    std::array<SDL_Rect, textures> reel_tokens;
};