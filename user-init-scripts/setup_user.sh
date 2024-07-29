#!/bin/bash

set +x
set +e

if [ ! -f ~/.container_user_is_init ]; then

  touch ~/.container_user_is_init

  /etc/user-init-scripts/install_pixi.sh
  /etc/user-init-scripts/install_cargo.sh
  /etc/user-init-scripts/install_go.sh
  /etc/user-init-scripts/install_nvim.sh
  /etc/user-init-scripts/install_fish.sh
  /etc/user-init-scripts/install_modern_dev_tools.sh

fi


