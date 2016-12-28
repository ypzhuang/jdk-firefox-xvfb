FROM ypzhuang/jdk_ubuntu

MAINTAINER John <yinzhuan@cisco.com>

ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true


ENV DISPLAY=":99.0" \
    FF_VERSION="42.0"

# install libs, xvfb and firefox
RUN apt-get update && apt-get install -y wget  zlib1g-dev xvfb libxcomposite1 libasound2 libdbus-glib-1-2 libgtk2.0-0
RUN apt-get install -y bzip2
RUN wget "https://download-installer.cdn.mozilla.net/pub/firefox/releases/${FF_VERSION}/linux-x86_64/en-US/firefox-${FF_VERSION}.tar.bz2" \
    -O /tmp/firefox.tar.bz2 && \
    tar xvf /tmp/firefox.tar.bz2 -C /opt && \
    ln -s /opt/firefox/firefox /usr/bin/firefox && \
    rm /tmp/firefox.tar.bz2


COPY docker-entrypoint.sh /root/
ENTRYPOINT ["/root/docker-entrypoint.sh"]












