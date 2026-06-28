# RECHE23/vcpkg-sci — vcpkg registry for the Sci* ecosystem

## Use it
`vcpkg-configuration.json`:

    {
      "default-registry": { "kind": "git", "repository": "https://github.com/microsoft/vcpkg", "baseline": "<a microsoft/vcpkg commit>" },
      "registries": [
        { "kind": "git", "repository": "https://github.com/RECHE23/vcpkg-sci", "baseline": "<latest vcpkg-sci commit>", "packages": ["real-regex"] }
      ]
    }

`vcpkg.json`: `{ "dependencies": ["real-regex"] }`

CMake (vcpkg toolchain):

    find_package(real CONFIG REQUIRED)
    target_link_libraries(your_app PRIVATE real::real)

## Ports
| Port | Description |
|------|-------------|
| `real-regex` | Header-only linear-time, ReDoS-safe regex engine for C++20 |
