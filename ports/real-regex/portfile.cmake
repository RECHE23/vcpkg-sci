vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO RECHE23/real-regex
    REF "v${VERSION}"
    SHA512 010320611b92326e581449aff7a513c2f894a20a1b6c7027f18605f1c2bc3de24fb20d31758f60a3849c2c75465463be14dcf38549d324973e23566790b780c4
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
