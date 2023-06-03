# syntax=docker/dockerfile:1.5
FROM archlinux:latest

LABEL org.opencontainers.image.version=0.0.1
LABEL org.opencontainers.image.source="https://github.com/exbotanical/devenv"
LABEL org.opencontainers.image.description="Containerized development environment"
LABEL org.opencontainers.image.licenses=MIT
LABEL org.opencontainers.image.authors="Matthew Zito"

ARG user=exbotanical

RUN pacman -Syu --noconfirm --needed git sudo vim gcc make stow unzip curl

RUN echo "$user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN useradd --create-home $user
USER $user

RUN curl -s https://ohmyposh.dev/install.sh | sudo bash -s

WORKDIR /home/$user

RUN mkdir -p /home/$user/.local/bin
RUN git clone --depth 1 https://github.com/exbotanical/dotfiles.git && cd dotfiles && make

WORKDIR /home/$user/app
