#include <iostream>
#include "renderer.h"

namespace acr {
  Renderer::Renderer(const Renderer::Args &args) {
    if(SDL_InitSubSystem(SDL_INIT_VIDEO) != 0) {
      std::cerr << "SDL_InitSubSystem Error: " << SDL_GetError() << std::endl;
      exit(EXIT_FAILURE);
    }
    
    window = SDL_CreateWindow(args.title, args.pos.x, args.pos.y,
        args.dim.x, args.dim.y, 0);
    if(window == nullptr) {
      std::cerr << "SDL_CreateWindow Error: " << SDL_GetError() << std::endl;
      exit(EXIT_FAILURE);
    }

    renderer = SDL_CreateRenderer(window, -1,
        SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);
    if(renderer == nullptr) {
      std::cerr << "SDL_CreateRenderer Error: " << SDL_GetError() << std::endl;
      exit(EXIT_FAILURE);
    }
  }

  Renderer::~Renderer() {
    if(renderer) {
      SDL_DestroyRenderer(renderer);
    }
    if(window) {
      SDL_DestroyWindow(window);
    }
  }

  __constant__ Scene gScene;
  
  void Renderer::loadScene(const Scene &scene) {
    // load scene onto gpu
  }

  __kernel__
  void Render::scatterTrace() {
    int x = blockIdx.x * gridDim.x + threadIdx.x;
    int y = blockIdx.y * gridDim.y + threadIdx.y;
    int sample = blockIdx.z * gridDim.z + threadIdx.z;

    
  }

  void Renderer::render() {
    // call kernel to render pixels then draw to screen
  }

}