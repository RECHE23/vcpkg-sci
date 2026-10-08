vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO RECHE23/real-regex
    REF "v${VERSION}"
    SHA512 fccc7940f2da070748864d2ebf995cbe030c4e4bab94b5b68025a8173c504fa4a3f5ac9a3fcdc8c39375027bea2321f0cad1f41cbcf99f759571f33415be3c42
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
