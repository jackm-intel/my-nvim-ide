#!/bin/bash

set +x
set +e

source ~/.bashrc

# install go
pixi global install go
echo "export PATH=~/go/bin:\$PATH" | tee -a ~/.bashrc
