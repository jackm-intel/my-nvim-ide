#!/bin/bash 

set +x
set +e

source ~/.bashrc

# install nvim with AstroNvim config
# --- The commented out lines below were
# --- when we used bob-nvim to manage neovim
# --- versions. It has weird path searches
# --- so it was dropped for pixi. However,
# --- it's left here in case we want to go
# --- back.
# BOB_CONFIG_DIR=~/.config/bob
# mkdir -p $BOB_CONFIG_DIR
# echo "export BOB_CONFIG=$BOB_CONFIG_DIR/config.json" | tee -a ~/.bashrc
# BOB_CONFIG=~/.config/bob/config.json
# cp /etc/naga-user-scripts/bob_config.json $BOB_CONFIG
# echo "export PATH=~/.local/share/bob/nvim-bin/:\$PATH" | tee -a ~/.bashrc
# PATH="~/.local/share/bob/nvim-bin/:$PATH"
# cargo install bob-nvim
# bob use latest
pixi global install nvim
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc
nvm install node && nvm use node

cargo install ripgrep
cargo install bottom
go install github.com/jesseduffield/lazygit@latest
go install github.com/dundee/gdu/v5/cmd/gdu@latest

pixi global install python git
git clone https://github.com/jackm-intel/astronvim_config.git ~/.config/nvim

