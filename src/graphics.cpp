#include "graphics.hpp"

void Graphics::init() {
    if(SDL_Init(SDL_INIT_VIDEO | SDL_INIT_AUDIO)) {
        std::cout << "\tSDL count not be initialized: " << SDL_GetError() << "\n";
        return;
    } else {
        std::cout << "\tInitialized SDL.\n";
    }

    int flags = IMG_INIT_PNG;
    int init_status = IMG_Init(flags);
    if ((init_status & flags) != flags) {
        std::cout << "\tSDL_image initialization of PNG format failed.\n";
        return;
    } else {
        std::cout << "\tInitialized SDL_image.\n";
    }
    std::cout << "\n";
}

void Graphics::create() {
    bool success = false;
    window = SDL_CreateWindow(
        "Slot Machine", 
        SDL_WINDOWPOS_UNDEFINED, 
        SDL_WINDOWPOS_UNDEFINED, 
        width, height, 
        SDL_WINDOW_SHOWN);

    if (window == NULL) {
        std::cout << "\tSDL couldn't create a window: " << SDL_GetError() << "\n";
        return;
    } else {
        std::cout << "\tCreated a window.\n";
    }

    renderer = SDL_CreateRenderer(
        window, 
        -1, 
        SDL_RENDERER_ACCELERATED);

    if (renderer == NULL) {
        std::cout << "\tSDL couldn't create a renderer: " << SDL_GetError() << "\n";
        return;
    } else {
        std::cout << "\tCreated a renderer.\n";
    }
    std::cout << "\n";
}

void Graphics::loadTextures() {
    background = IMG_LoadTexture(renderer, "../../assets/imgs/background.png");

    if (background == nullptr) {
        std::cout << "\tSDL_image: failed to load ../../assets/imgs/background.png.\n";
    } else {
        std::cout << "\tLoaded background image.\n";
    }

    plate = IMG_LoadTexture(renderer, "../../assets/imgs/plate.png");

    if (plate == nullptr) {
        std::cout << "\tSDL_image: failed to load ../../assets/imgs/plate.png.\n";
    } else {
        std::cout << "\tLoaded plate image.\n";
    }

    star = IMG_LoadTexture(renderer, "../../assets/imgs/star.png");

    if (star == nullptr) {
        std::cout << "\tSDL_image: failed to load ../../assets/imgs/star.png.\n";
    } else {
        std::cout << "\tLoaded star token.\n";
    }

    square = IMG_LoadTexture(renderer, "../../assets/imgs/square.png");

    if (square == nullptr) {
        std::cout << "\tSDL_image: failed to load ../../assets/imgs/square.png.\n";
    } else {
        std::cout << "\tLoaded square token.\n";
    }

    circle = IMG_LoadTexture(renderer, "../../assets/imgs/circle.png");

    if (circle == nullptr) {
        std::cout << "\tSDL_image: failed to load ../../assets/imgs/circle.png.\n";
    } else {
        std::cout << "\tLoaded circle token.\n";
    }

    reels.reels = IMG_LoadTexture(renderer, "../../assets/imgs/reels.png");

    if (reels.reels == nullptr) {
        std::cout << "\tSDL_image: failed to load ../../assets/imgs/reels.png.\n";
    } else {
        std::cout << "\tLoaded reels; ";
        int w, h;
        SDL_QueryTexture(reels.reels, nullptr, nullptr, &w, &h);
        reels.dst = SDL_Rect({36, 65, w, h});
        std::cout << "w: " << w << ", h: " << h << ".\n";
    }

    shadows.shadows = IMG_LoadTexture(renderer, "../../assets/imgs/shadows.png");

    if (shadows.shadows == nullptr) {
        std::cout << "\tSDL_image: failed to load ../../assets/imgs/shadows.png.\n";
    } else {
        std::cout << "\tLoaded shadows for reels; ";
        int w, h;
        SDL_QueryTexture(shadows.shadows, nullptr, nullptr, &w, &h);
        shadows.dst = SDL_Rect({36, 65, w, h});
        std::cout << "w: " << w << ", h: " << h << ".\n";
    }

    for (int i = 0; i < textures; ++i) {
        machine.textures.at(i) = IMG_LoadTexture(renderer, ("../../assets/imgs/machine_" + std::to_string(i) + ".png").c_str());
        if (machine.textures.at(i) == nullptr) {
            std::cout << "\tSDL_image: failed to load ../../assets/imgs/machine_" + std::to_string(i) + ".png.\n";
        } else {
            std::cout << "\tLoaded machine_" + std::to_string(i) + ".png; ";
            int w, h;
            SDL_QueryTexture(machine.textures.at(i), nullptr, nullptr, &w, &h);
            machine.dst.at(i) = SDL_Rect({11, 11, w, h});
            std::cout << "w: " << w << ", h: " << h << ".\n";
        }

        lever.textures.at(i) = IMG_LoadTexture(renderer, ("../../assets/imgs/lever_" + std::to_string(i) + ".png").c_str());
        if (lever.textures.at(i) == nullptr) {
            std::cout << "\tSDL_image: failed to load ../../assets/imgs/lever_" + std::to_string(i) + ".png.\n";
        } else { 
            std::cout << "\tLoaded lever_" + std::to_string(i) + ".png; ";
            int w, h;
            SDL_QueryTexture(lever.textures.at(i), nullptr, nullptr, &w, &h);
            lever.dst.at(i) = SDL_Rect({511, 27, w, h});
            std::cout << "w: " << w << ", h: " << h << ".\n";
        }
    }

    // a small button on the front panel of the machine
    stop_button = SDL_Rect({441, 438, 65, 15});

    // reel tokens, centered
    reel_tokens = { 
        SDL_Rect({ 44, 174, token_dimensions, token_dimensions }),
        SDL_Rect({ 204, 174, token_dimensions, token_dimensions }),
        SDL_Rect({ 365, 174, token_dimensions, token_dimensions })
    };

    extended_reel_h = shadows.dst.h + token_dimensions * 2;

    std::cout << "\n";
}

SDL_Rect* Graphics::getLeverRect() {
    return &lever.dst.front();
}

SDL_Rect* Graphics::getStopButtonRect() {
    return &stop_button;
}

void Graphics::setRenderTarget() {
    if(SDL_SetRenderTarget(renderer, nullptr) < 0) {
        std::cout << "\tError setting window as render target.\n";
    } else {
        std::cout << "\tSet window as render target.\n";
    }
    std::cout << "\n";
}

Graphics::Graphics() {
    init();
    create();
    loadTextures();
    setRenderTarget();
}

Graphics::~Graphics() {
    SDL_DestroyTexture(background);
    SDL_DestroyTexture(plate);
    SDL_DestroyTexture(reels.reels);
    SDL_DestroyTexture(shadows.shadows);
    for (auto& texture : machine.textures)
        SDL_DestroyTexture(texture);
    for (auto& texture : lever.textures)
        SDL_DestroyTexture(texture);

    SDL_DestroyTexture(star);
    SDL_DestroyTexture(circle);
    SDL_DestroyTexture(square);

    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);

    IMG_Quit(); // destroy sdl_image
    SDL_Quit(); // destroy sdl
}

void Graphics::display(std::vector<Reel> reels) {
    start = SDL_GetTicks();
    // the rest of the visuals go here

    // the background
    SDL_RenderCopy(renderer, background, nullptr, nullptr);

    // the reels
    SDL_RenderCopy(renderer, this->reels.reels, nullptr, &this->reels.dst);
    
    // symbols on the reels
    for (int i = 0; i < textures; ++i) {
        SDL_Texture** texture;
        auto token = reels.at(i).getSymbol();
        switch(token) {
            case Reel::Symbol::STAR:
                texture = &star;
                break;
            case Reel::Symbol::CIRCLE:
                texture = &circle;
                break;
            case Reel::Symbol::SQUARE:
                texture = &square;
                break;
        }
        SDL_RenderCopy(
            renderer, 
            *texture, 
            nullptr, 
            &reel_tokens.at(i));
    }

    // the shadows on the reels,
    SDL_RenderCopy(
        renderer, 
        shadows.shadows, 
        nullptr, 
        &shadows.dst);
    
    // the plate
    SDL_RenderCopy(renderer, plate, nullptr, nullptr);

    // the lever
    SDL_RenderCopy(
        renderer, 
        lever.textures.at(lever.state), 
        nullptr, 
        &lever.dst.at(lever.state));
        
    // the machine
    SDL_RenderCopy(
        renderer, 
        machine.textures.at(machine.state), 
        nullptr, 
        &machine.dst.at(machine.state));

    // at last, present renderer
    SDL_RenderPresent(renderer);
}

void Graphics::resetLever() {
    lever.state = 0;
}

void Graphics::pullLever() {
    lever.state = 1;
}

void Graphics::pullLeverDown() {
    lever.state = 2;
}

void Graphics::lightStopButton() {
    machine.state = 1;
}

void Graphics::killStopButton() {
    machine.state = 0;
}

void Graphics::lightMachine() {
    machine.state = 2;
}

void Graphics::killMachineLight() {
    machine.state = 0;
}

void Graphics::handle_tokens(std::array<double, textures> coefs) {
    std::deque<double> new_positions;
    for (auto& coef : coefs) {
        new_positions.push_back((extended_reel_h * coef) - token_dimensions);
    }

    for (auto& token : reel_tokens) {
        token.y = static_cast<int>(new_positions.front());
        new_positions.pop_front();
    }
}

void Graphics::delay() const {
    if(1000/30>(SDL_GetTicks() - start))
        SDL_Delay(1000 / 30 - (SDL_GetTicks() - start));
}