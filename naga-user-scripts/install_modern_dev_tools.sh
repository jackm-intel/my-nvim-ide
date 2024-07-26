#!/bin/bash

set +x
set +e

source ~/.bashrc

pixi global install cmake clang-format cmake-format clang-tools ninja gcc make clangxx clang
