#!/bin/bash

set +x
set +e

echo $CR_PAT | podman login ghcr.io --username jackm-intel --password-stdin

podman build . --target  my-nvim-ide:rocky9 -t ghcr.io/jackm-intel/my-nvim-ide:rocky9

podman tag ghcr.io/jackm-intel/my-nvim-ide:rocky9 ghcr.io/jackm-intel/my-nvim-ide:rocky-latest
podman tag ghcr.io/jackm-intel/my-nvim-ide:rocky9 ghcr.io/jackm-intel/my-nvim-ide:latest

podman push ghcr.io/jackm-intel/my-nvim-ide:rocky9 
podman push ghcr.io/jackm-intel/my-nvim-ide:rocky-latest
podman push ghcr.io/jackm-intel/my-nvim-ide:latest

podman build . --target  my-nvim-ide:ubu22.04 -t ghcr.io/jackm-intel/my-nvim-ide:ubu22.04 

podman tag ghcr.io/jackm-intel/my-nvim-ide:ubu22.04 ghcr.io/jackm-intel/my-nvim-ide:ubu-latest

podman push ghcr.io/jackm-intel/my-nvim-ide:ubu22.04
podman push ghcr.io/jackm-intel/my-nvim-ide:ubu-latest
