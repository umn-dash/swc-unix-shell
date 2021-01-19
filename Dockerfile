FROM jupyter/scipy-notebook:6d42503c684f

MAINTAINER David Naughton <naughton@umn.edu>

USER root
RUN mv /etc/dpkg/dpkg.cfg.d/excludes /etc/dpkg/dpkg.cfg.d/excludes.dpkg-tmp && \
    apt update -y && \
    apt install -y less man-db && \
    mv /usr/bin/man.REAL /usr/bin/man && \
    rm -r /var/lib/apt/lists/*

USER $NB_UID
RUN mkdir "/home/${NB_USER}/Desktop" && \
    cd "/home/${NB_USER}/Desktop" && \
    wget https://swcarpentry.github.io/shell-novice/data/data-shell.zip && \
    unzip data-shell.zip && \
    chmod -R g+rw "/home/${NB_USER}/Desktop" && \
    echo "PS1='\$ '" >> ~/.bashrc
