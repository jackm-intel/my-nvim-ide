FROM public.ecr.aws/docker/library/rockylinux:9 as dev-tools
# LABEL org.opencontainers.image.source=https://github.com/NAGAGroup/naga-dev-containers

RUN mkdir -p /etc/user-init-scripts

RUN touch ~/.container_user_is_init

ENV USER_INSTALL_SCRIPT "install_pixi.sh"
COPY user-init-scripts/$USER_INSTALL_SCRIPT /etc/user-init-scripts/$USER_INSTALL_SCRIPT
RUN chmod +x /etc/user-init-scripts/$USER_INSTALL_SCRIPT
RUN bash --rcfile ~/.bashrc --noprofile -i /etc/user-init-scripts/$USER_INSTALL_SCRIPT

ENV USER_INSTALL_SCRIPT "install_go.sh"
COPY user-init-scripts/$USER_INSTALL_SCRIPT /etc/user-init-scripts/$USER_INSTALL_SCRIPT
RUN chmod +x /etc/user-init-scripts/$USER_INSTALL_SCRIPT
RUN bash --rcfile ~/.bashrc --noprofile -i /etc/user-init-scripts/$USER_INSTALL_SCRIPT

ENV USER_INSTALL_SCRIPT "install_cargo.sh"
COPY user-init-scripts/$USER_INSTALL_SCRIPT /etc/user-init-scripts/$USER_INSTALL_SCRIPT
RUN chmod +x /etc/user-init-scripts/$USER_INSTALL_SCRIPT
RUN bash --rcfile ~/.bashrc --noprofile -i /etc/user-init-scripts/$USER_INSTALL_SCRIPT

ENV USER_INSTALL_SCRIPT "install_nvim.sh"
COPY user-init-scripts/$USER_INSTALL_SCRIPT /etc/user-init-scripts/$USER_INSTALL_SCRIPT
RUN chmod +x /etc/user-init-scripts/$USER_INSTALL_SCRIPT
RUN bash --rcfile ~/.bashrc --noprofile -i /etc/user-init-scripts/$USER_INSTALL_SCRIPT

ENV USER_INSTALL_SCRIPT "install_fish.sh"
COPY user-init-scripts/$USER_INSTALL_SCRIPT /etc/user-init-scripts/$USER_INSTALL_SCRIPT
RUN chmod +x /etc/user-init-scripts/$USER_INSTALL_SCRIPT
RUN bash --rcfile ~/.bashrc --noprofile -i /etc/user-init-scripts/$USER_INSTALL_SCRIPT

ENV USER_INSTALL_SCRIPT "install_modern_dev_tools.sh"
COPY user-init-scripts/$USER_INSTALL_SCRIPT /etc/user-init-scripts/$USER_INSTALL_SCRIPT
RUN chmod +x /etc/user-init-scripts/$USER_INSTALL_SCRIPT
RUN bash --rcfile ~/.bashrc --noprofile -i /etc/user-init-scripts/$USER_INSTALL_SCRIPT

# This will provide clipboard integration in neovim
RUN dnf install epel-release -y
RUN dnf install wl-clipboard xclip -y

ENV USER_INSTALL_SCRIPT "setup_user.sh"
COPY user-init-scripts/$USER_INSTALL_SCRIPT /etc/user-init-scripts/$USER_INSTALL_SCRIPT
RUN chmod +x /etc/user-init-scripts/$USER_INSTALL_SCRIPT
RUN ln -s /etc/user-init-scripts/$USER_INSTALL_SCRIPT /etc/profile.d/10-setup-user.sh

FROM public.ecr.aws/docker/library/rockylinux:9 as my-nvim-ide:rockylinux9
ENTRYPOINT ["/etc/user-init-scripts/entrypoint.sh"]

FROM public.ecr.aws/ubuntu/ubuntu:22.04_stable as my-nvim-ide:ubu22.04
COPY --from=dev-tools /root /root
COPY --from=dev-tools /etc/user-init-scripts /etc/user-init-scripts

RUN ln -s /etc/user-init-scripts/10-setup-user.sh /etc/profile.d/10-setup-user.sh
RUN apt update && apt install wl-clipboard xclip -y
ENTRYPOINT ["/etc/user-init-scripts/entrypoint.sh"]
