vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO RECHE23/real-regex
    REF "v${VERSION}"
    SHA512 9e9dedd5502e0aca8cf7f7366768fd4528406e27a45c39c553ee1c45d334cbfae138fcadbc5509104b2edee258b22575e49220988ae7bdee9e95e2d82a86d337
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
