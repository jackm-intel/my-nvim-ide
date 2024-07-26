#!/bin/bash --login 

set +x
set +e

# install pixi
curl -fsSL https://pixi.sh/install.sh | bash
export PATH=~/.pixi/bin:$PATH
mkdir -p ~/.local/share/bash-completion/
pixi completion --shell bash | tee ~/.local/share/bash-completion/pixi.sh
