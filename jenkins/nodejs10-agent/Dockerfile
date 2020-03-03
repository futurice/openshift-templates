FROM jenkins/jnlp-slave:3.40-1
MAINTAINER Yannick Scherer <yannick.scherer@futurice.com>

USER root

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get -y update && \
    apt-get -y install \
        yarn \
        nodejs && \
    chown -R 1000:0 $HOME && \
    chmod -R g+rw $HOME && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
