from conan import ConanFile


class CompressorRecipe(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeToolchain", "CMakeDeps"

    def requirements(self):
        self.requires("sdl/[*]", override=True)
        self.requires("sdl_image/2.0.5")
        self.requires("sdl_mixer/2.0.4")

    def build_requirements(self):
        self.tool_requires("cmake/3.22.6")