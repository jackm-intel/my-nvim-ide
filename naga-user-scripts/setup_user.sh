#!/bin/bash

set +x
set +e

if [ ! -f ~/.container_user_is_init ]; then

  touch ~/.container_user_is_init

  /etc/naga-user-scripts/install_pixi.sh
  /etc/naga-user-scripts/install_cargo.sh
  /etc/naga-user-scripts/install_go.sh
  /etc/naga-user-scripts/install_nvim.sh
  /etc/naga-user-scripts/install_fish.sh
  /etc/naga-user-scripts/install_modern_dev_tools.sh

fi


