FROM ubuntu:14.04
MAINTAINER Nicolas Lamirault <nicolas.lamirault@gmail.com>

RUN apt-get -y update
RUN apt-get -y upgrade

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
RUN cd /.emacs.d && /.cask/bin/cask install

RUN apt-get -y install make
ADD ./Makefile /.emacs.d/Makefile
ADD ./test /.emacs.d/test

# Set the default directory where CMD will execute
# WORKDIR /.emacs.d

# Emacs
# CMD ["/usr/bin/emacs-snapshot"]
