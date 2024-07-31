FROM public.ecr.aws/docker/library/rockylinux:9 as dev-tools
# LABEL org.opencontainers.image.source=https://github.com/NAGAGroup/naga-dev-containers

# This will provide clipboard integration in neovim
RUN dnf install epel-release -y
RUN dnf install wl-clipboard xclip -y

COPY user-init-scripts /etc/user-init-scripts
RUN find /etc/user-init-scripts -type f -wholename "/etc/user-init-scripts/*" | xargs chmod +x
RUN find /etc/user-init-scripts -type f -wholename "/etc/user-init-scripts/profile.d/*" | xargs -I'{}' ln -s '{}' /etc/profile.d
RUN find /etc/user-init-scripts -type f -wholename "/etc/user-init-scripts/bin/*" | xargs -I'{}' ln -s '{}' /usr/bin

FROM public.ecr.aws/docker/library/rockylinux:9 as my-nvim-ide:rocky9
ENTRYPOINT ["/etc/user-init-scripts/entrypoint.sh"]

FROM public.ecr.aws/ubuntu/ubuntu:22.04_stable as my-nvim-ide:ubu22.04
COPY --from=dev-tools /etc/user-init-scripts /etc/user-init-scripts
RUN find /etc/user-init-scripts -type f -wholename "/etc/user-init-scripts/*" | xargs chmod +x
RUN find /etc/user-init-scripts -type f -wholename "/etc/user-init-scripts/profile.d/*" | xargs -I'{}' ln -s '{}' /etc/profile.d
RUN find /etc/user-init-scripts -type f -wholename "/etc/user-init-scripts/bin/*" | xargs -I'{}' ln -s '{}' /usr/bin

RUN apt update && apt install wl-clipboard xclip wget curl -y
ENTRYPOINT ["/etc/user-init-scripts/entrypoint.sh"]
