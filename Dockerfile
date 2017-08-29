FROM debian:jessie

MAINTAINER Alexis Vincent <alexis@alexisvincent.io>

# Distro
ENV DEBIAN_FRONTEND noninteractive

RUN mkdir -p /root/mnt
WORKDIR /root/mnt

RUN apt-get update

# Common packages
RUN apt-get install -q -y					\

    # basic system tools
    sudo                          \
    wget                          \
    curl                          \
    zsh                           \
    git                           \
    netcat                        \
    openssh-client                \
    openssh-server                \

    # editors
    emacs                         \
    vim											      \

    # c/c++ compiler tools
    build-essential               \
    clang                         \
    doxygen                       \

    # open-mpi
    openmpi-bin                   \
    openmpi-common                \
    libopenmpi-dev                \
    # libopenmpi-dbg

    # cleanup install cache
    && apt-get clean -q -y

#install latest cmake
RUN wget -q https://cmake.org/files/v3.8/cmake-3.8.0-Linux-x86_64.sh && \
    mkdir /opt/cmake && \
    sh cmake-3.8.0-Linux-x86_64.sh --prefix=/opt/cmake --skip-license && \
    ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake && \
    rm cmake-3.8.0-Linux-x86_64.sh

RUN git clone https://github.com/alexisvincent/dotfiles ~/.dotfiles
RUN git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
# RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true

# RUN cd ~/.dotfiles && ./bootstrap.sh

# RUN emacs --daemon

CMD zsh

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" | sudo tee -a /etc/apt/sources.list.d/jessie-backports.list
# RUN add-apt-repository ppa:openjdk-r/ppa

# Additional libs so as not to break cache
# UNCOMMENT IF WORKING ON THIS FILE
RUN sudo apt-get update
RUN apt-get -t jessie-backports install -yq \
    openjdk-8-jdk openjdk-8-jre

ENV CC=clang
ENV CXX=clang++
