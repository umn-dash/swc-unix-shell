FROM jupyter/scipy-notebook:6d42503c684f

MAINTAINER David Naughton <naughton@umn.edu>

RUN mkdir "/home/${NB_USER}/Desktop" && \
    cd "/home/${NB_USER}/Desktop" && \
    wget https://swcarpentry.github.io/shell-novice/data/data-shell.zip && \
    unzip data-shell.zip && \
    chmod -R g+rw "/home/${NB_USER}/Desktop" && \
    echo "PS1='\$ '" >> ~/.bashrc
