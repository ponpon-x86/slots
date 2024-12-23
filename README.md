# slots
**Note:**
The project uses *conan*:
```
conan install . --output-folder=build --build=missing
cmake --preset conan-default
cmake --build --preset conan-release
```