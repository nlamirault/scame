FROM ubuntu:15.04
MAINTAINER Nicolas Lamirault <nicolas.lamirault@gmail.com>

RUN apt-get -y update

RUN apt-get -y install python curl software-properties-common git

# Install Emacs
RUN add-apt-repository -y ppa:ubuntu-elisp/ppa
RUN apt-get update
RUN apt-get install -y libgtk-3-0
RUN apt-get install -y emacs-snapshot

# Download Cask
RUN curl -fsSkL https://raw.github.com/cask/cask/master/go -o /tmp/cask.py && \
    chmod +x /tmp/cask.py && \
    /tmp/cask.py

# Install Scame
RUN mkdir -p /.emacs.d
ADD ./src/ /.emacs.d/
RUN mkdir -p /.config/scame/
ADD ./templates/scame-user.el /.config/scame/
RUN cd /.emacs.d && /root/.cask/bin/cask install

# Emacs
# CMD ["/usr/bin/emacs-snapshot"]
ENTRYPOINT /usr/bin/emacs-snapshot
