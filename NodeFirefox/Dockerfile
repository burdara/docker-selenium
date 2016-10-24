FROM selenium/node-firefox:2.44.0
MAINTAINER Selenium <selenium-developers@googlegroups.com>

USER root

#=========
# Firefox
#=========
RUN wget -P /tmp/ https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/33.1.1/linux-x86_64/en-US/firefox-33.1.1.tar.bz2 \
  && tar -xvjf /tmp/firefox-33.1.1.tar.bz2 -C /tmp/ \
  && mv /tmp/firefox /opt/firefox33 \
  && ln -s -f /opt/firefox33/firefox /usr/bin/firefox

#========================
# Selenium Configuration
#========================
COPY config.json /opt/selenium/config.json

USER seluser
