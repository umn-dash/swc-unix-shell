FROM jupyter/scipy-notebook:6d42503c684f

MAINTAINER David Naughton <naughton@umn.edu>

USER root
RUN apt update -y && \
    apt install -y less man

# install manpages, ignoring this harmless error:
# The command '/bin/bash -o pipefail -c yes | unminimize' returned a non-zero code: 141
RUN yes | unminimize \ 
    || if [[ $? -eq 141 ]]; then true; else exit $?; fi

USER $NB_UID
RUN mkdir "/home/${NB_USER}/Desktop" && \
    cd "/home/${NB_USER}/Desktop" && \
    wget https://swcarpentry.github.io/shell-novice/data/data-shell.zip && \
    unzip data-shell.zip && \
    chmod -R g+rw "/home/${NB_USER}/Desktop" && \
    echo "PS1='\$ '" >> ~/.bashrc
