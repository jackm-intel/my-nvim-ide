FROM public.ecr.aws/docker/library/rockylinux:9 as install_dev_tools
# LABEL org.opencontainers.image.source=https://github.com/NAGAGroup/naga-dev-containers

RUN mkdir -p /etc/naga-user-scripts

RUN touch ~/.container_user_is_init

ENV USER_INSTALL_SCRIPT "install_pixi.sh"
COPY naga-user-scripts/$USER_INSTALL_SCRIPT /etc/naga-user-scripts/$USER_INSTALL_SCRIPT
RUN chmod +x /etc/naga-user-scripts/$USER_INSTALL_SCRIPT
RUN /etc/naga-user-scripts/$USER_INSTALL_SCRIPT

ENV USER_INSTALL_SCRIPT "install_go.sh"
COPY naga-user-scripts/$USER_INSTALL_SCRIPT /etc/naga-user-scripts/$USER_INSTALL_SCRIPT
RUN chmod +x /etc/naga-user-scripts/$USER_INSTALL_SCRIPT
RUN /etc/naga-user-scripts/$USER_INSTALL_SCRIPT

ENV USER_INSTALL_SCRIPT "install_cargo.sh"
COPY naga-user-scripts/$USER_INSTALL_SCRIPT /etc/naga-user-scripts/$USER_INSTALL_SCRIPT
RUN chmod +x /etc/naga-user-scripts/$USER_INSTALL_SCRIPT
RUN /etc/naga-user-scripts/$USER_INSTALL_SCRIPT

ENV USER_INSTALL_SCRIPT "install_nvim.sh"
COPY naga-user-scripts/$USER_INSTALL_SCRIPT /etc/naga-user-scripts/$USER_INSTALL_SCRIPT
RUN chmod +x /etc/naga-user-scripts/$USER_INSTALL_SCRIPT
RUN /etc/naga-user-scripts/$USER_INSTALL_SCRIPT

ENV USER_INSTALL_SCRIPT "install_fish.sh"
COPY naga-user-scripts/$USER_INSTALL_SCRIPT /etc/naga-user-scripts/$USER_INSTALL_SCRIPT
RUN chmod +x /etc/naga-user-scripts/$USER_INSTALL_SCRIPT
RUN /etc/naga-user-scripts/$USER_INSTALL_SCRIPT

ENV USER_INSTALL_SCRIPT "install_modern_dev_tools.sh"
COPY naga-user-scripts/$USER_INSTALL_SCRIPT /etc/naga-user-scripts/$USER_INSTALL_SCRIPT
RUN chmod +x /etc/naga-user-scripts/$USER_INSTALL_SCRIPT
RUN /etc/naga-user-scripts/$USER_INSTALL_SCRIPT

ENV USER_INSTALL_SCRIPT "setup_user.sh"
COPY naga-user-scripts/$USER_INSTALL_SCRIPT /etc/naga-user-scripts/$USER_INSTALL_SCRIPT
RUN chmod +x /etc/naga-user-scripts/$USER_INSTALL_SCRIPT
RUN ln -s /etc/naga-user-scripts/$USER_INSTALL_SCRIPT /etc/profile.d/10-setup-user.sh
