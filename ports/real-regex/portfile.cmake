vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO RECHE23/real-regex
    REF "v${VERSION}"
    SHA512 085569b2e9857964baf7dccbe1c92f8adf5f23dc66280bdc0a3ec7def89dc73869d36a8c48e676110fa71bc186bdc9e97b19ae9ac4164573db435548eee1acf2
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS -DBUILD_TESTING=OFF   # library only — keeps the SciForge test harness out (Slice 1a)
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME real CONFIG_PATH lib/cmake/real)
vcpkg_fixup_pkgconfig()

# Header-only: the debug tree duplicates the release headers — drop it.
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
