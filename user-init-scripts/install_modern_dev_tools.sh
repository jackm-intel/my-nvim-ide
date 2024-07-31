set +x
set +e

sudo mkdir -p /etc/pixi-manifests/cmake-project
sudo chown -R $USER:$USER /etc/pixi-manifests
cd /etc/pixi-manifests/cmake-project
pixi init
pixi add --no-lockfile-update cmake clang-format cmake-format clang-tools ninja make clangdev compilers

pixi global install cmake clang-format cmake-format clang-tools ninja gcc gxx binutils make clangxx clang unzip
