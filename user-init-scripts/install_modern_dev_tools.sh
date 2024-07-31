set +x
set +e

mkdir -p /etc/pixi-manifests/cmake-project
cd /etc/pixi-manifests/cmake-project
pixi init
pixi add --no-lockfile-update cmake clang-format cmake-format clang-tools ninja make clangdev compilers

pixi global install cmake clang-format cmake-format clang-tools ninja gcc make clangxx clang unzip
