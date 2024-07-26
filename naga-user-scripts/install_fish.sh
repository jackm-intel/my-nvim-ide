#!/bin/bash

set +x
set +e

source ~/.bashrc

# install fish shell and some nice-to-haves
pixi global install fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | tee install_omf.fish
~/.pixi/bin/fish install_omf.fish --noninteractive
rm install_omf.fish
~/.pixi/bin/fish -c "omf install bass"
mkdir -p ~/.config/fish/completions/
pixi completion --shell fish | tee ~/.config/fish/completions/pixi.fish
