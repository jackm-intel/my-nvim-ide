FROM public.ecr.aws/docker/library/rockylinux:9 as dev-tools
# LABEL org.opencontainers.image.source=https://github.com/NAGAGroup/naga-dev-containers

# This will provide clipboard integration in neovim
RUN dnf install epel-release -y
RUN dnf install wl-clipboard xclip -y

COPY user-init-scripts /etc/user-init-scripts
RUN find /etc/user-init-scripts -name '*.sh' | xargs chmod +x 
RUN ln -s /etc/user-init-scripts/$USER_INSTALL_SCRIPT /etc/profile.d/10-setup-user.sh

FROM public.ecr.aws/docker/library/rockylinux:9 as my-nvim-ide:rockylinux9
ENTRYPOINT ["/etc/user-init-scripts/entrypoint.sh"]

FROM public.ecr.aws/ubuntu/ubuntu:22.04_stable as my-nvim-ide:ubu22.04
COPY --from=dev-tools /etc/user-init-scripts /etc/user-init-scripts

RUN ln -s /etc/user-init-scripts/10-setup-user.sh /etc/profile.d/10-setup-user.sh
RUN apt update && apt install wl-clipboard xclip wget curl -y
ENTRYPOINT ["/etc/user-init-scripts/entrypoint.sh"]
