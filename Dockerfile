#-*-shell-script-*-

FROM ubuntu

MAINTAINER Garrett Smith <g@rre.tt>

ARG version=UNSET
ARG archive=guild_${version}_linux_x86_64.tar.gz

ADD /$archive /opt
