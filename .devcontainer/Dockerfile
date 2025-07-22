FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade && apt-get install -y \
    gawk wget git diffstat unzip texinfo gcc build-essential \
    chrpath socat cpio python3-full python3-pip python3-pexpect xz-utils \
    debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa \
    libsdl1.2-dev xterm locales screen sudo vim rsync curl \
    libssl-dev tcl libncurses5-dev tmux \
    && apt-get clean

RUN locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
    
RUN curl -o /usr/bin/repo https://storage.googleapis.com/git-repo-downloads/repo && \
chmod a+x /usr/bin/repo

RUN useradd -ms /bin/bash -G sudo yocto
RUN echo "yocto ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER yocto
WORKDIR /home/yocto

RUN mkdir -p /home/yocto/.ssh-agent && chown -R yocto:yocto /home/yocto/.ssh-agent

RUN pip3 install Django>4.2 \
    && pip3 install beautifulsoup4>=4.4.0 \
    && pip3 install pytz \
    && pip3 install django-log-viewer==1.1.7

SHELL ["/bin/bash", "-c"]
CMD ["/bin/bash"]