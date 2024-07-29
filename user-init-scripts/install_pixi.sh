set +x
set +e

# install pixi
curl -fsSL https://pixi.sh/install.sh | bash
mkdir -p ~/.local/share/bash-completion/
pixi completion --shell bash | tee ~/.local/share/bash-completion/pixi.sh
