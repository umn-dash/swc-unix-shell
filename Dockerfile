FROM jupyter/scipy-notebook

MAINTAINER David Naughton <naughton@umn.edu>

USER root
# Remove the manpage blacklist, install man, install manpages
RUN rm /etc/dpkg/dpkg.cfg.d/excludes && \
    apt update -y && \
    apt install -y less && \
    dpkg -l | grep ^ii | cut -d' ' -f3 | xargs apt install -yq --no-install-recommends --reinstall man && \
    apt clean && \
    mv /usr/bin/man.REAL /usr/bin/man && \
    rm -rf /var/lib/apt/lists/*

USER $NB_UID
RUN mkdir "/home/${NB_USER}/Desktop" && \
    cd "/home/${NB_USER}/Desktop" && \
    wget https://swcarpentry.github.io/shell-novice/data/shell-lesson-data.zip && \
    unzip shell-lesson-data.zip && \
    chmod -R g+rw "/home/${NB_USER}/Desktop" && \
    echo "PS1='\$ '" >> ~/.bashrc
