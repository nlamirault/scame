FROM ubuntu:14.04
MAINTAINER Nicolas Lamirault <nicolas.lamirault@gmail.com>

RUN apt-get -y update

RUN apt-get -y install python curl software-properties-common git

# Install Emacs
RUN add-apt-repository -y ppa:ubuntu-elisp/ppa
RUN apt-get update
RUN apt-get install -y emacs-snapshot

# Download Cask
RUN curl -fsSkL https://raw.github.com/cask/cask/master/go -o /tmp/cask.py && \
    chmod +x /tmp/cask.py && \
    /tmp/cask.py

# Install Scame
RUN mkdir -p /.emacs.d
ADD ./src/ /.emacs.d/
#ADD ./toto /.emacs.d/
#RUN cd /.emacs.d && /.cask/bin/cask install --debug --verbose

# RUN apt-get -y install make
# ADD ./Makefile /.emacs.d/Makefile
# ADD ./test /.emacs.d/test

# USER developer
# ENV HOME /home/developer
# CMD /usr/bin/emacs-snapshot

RUN cd /.emacs.d && /.cask/bin/cask install

# Emacs
# CMD ["/usr/bin/emacs-snapshot"]
ENTRYPOINT /usr/bin/emacs-snapshot
