FROM ubuntu:14.04
MAINTAINER Nicolas Lamirault <nicolas.lamirault@gmail.com>

RUN apt-get -y update

RUN apt-get -y install python curl software-properties-common git

# Install Emacs
RUN add-apt-repository -y ppa:ubuntu-elisp/ppa
RUN apt-get update
RUN apt-get install -y emacs-snapshot

# Download Cask
RUN curl -fsSkL https://raw.github.com/cask/cask/master/go -o /tmp/cask.py
RUN python /tmp/cask.py

# Install Scame
#RUN mkdir -p /.emacs.d
ADD ./src/Cask /.emacs.d/Cask
ADD ./src/init.el /.emacs.d/init.el
ADD ./src/scame.el /.emacs.d/scame.el
ADD ./src/lisp /.emacs.d/lisp
ADD ./src/gnus /.emacs.d/gnus
RUN cd /.emacs.d && /.cask/bin/cask install

RUN apt-get -y install make
ADD ./Makefile /.emacs.d/Makefile
ADD ./test /.emacs.d/test

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer
CMD /usr/bin/emacs-snapshot

# Set the default directory where CMD will execute
# WORKDIR /.emacs.d

# Emacs
# CMD ["/usr/bin/emacs-snapshot"]
