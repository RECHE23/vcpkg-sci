vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO RECHE23/real-regex
    REF "v${VERSION}"
    SHA512 5e9d7d4b2175c9b2fcf7972d80c41cbcd3b93c950a684c44664f6312d498054ce43db13c316df33badc5cbaf3ac774e6cd38632b8f874dd1f26bbb023fdb00d6
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
