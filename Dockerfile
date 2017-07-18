#-*-shell-script-*-

FROM gcr.io/tensorflow/tensorflow

MAINTAINER Garrett Smith <g@rre.tt>

ARG version=UNSET
ARG archive=guild_${version}_linux_x86_64.tar.gz

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y libssl-dev git
RUN pip install --upgrade psutil

RUN useradd -m -s /bin/bash guild
USER guild
WORKDIR /home/guild

ADD /$archive /opt
ADD /guild-bashrc /home/guild/.bashrc

ENTRYPOINT /bin/bash
