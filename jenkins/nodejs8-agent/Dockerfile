FROM openshift/jenkins-slave-base-centos7
MAINTAINER Yannick Scherer <yannick.scherer@futurice.com>

RUN curl -sL https://rpm.nodesource.com/setup_8.x | bash - && \
    curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo && \
    yum check-update && \
    yum install -y nodejs yarn && \
    yum clean all -y && \
    chown -R 1001:0 $HOME && \
    chmod -R g+rw $HOME

USER 1001
