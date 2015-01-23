FROM selenium/node-base:2.44.0
MAINTAINER Selenium <selenium-developers@googlegroups.com>

USER root

#=========
# Firefox
#=========
RUN wget -P /tmp ftp://ftp.mozilla.org/pub/firefox/releases/33.1.1/linux-x86_64/en-US/firefox-33.1.1.tar.bz2 \
  && tar -xvjf /tmp/firefox-33.1.1.tar.bz2 -C /opt \
  && ln -s -f /opt/firefox/firefox /usr/bin/firefox


#========================
# Selenium Configuration
#========================
COPY config.json /opt/selenium/config.json

USER seluser
