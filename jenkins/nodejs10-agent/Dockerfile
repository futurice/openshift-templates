# FROM jenkins/jnlp-slave:3.40-1
# FROM quay.io/openshift/origin-jenkins-agent-nodejs:4.6.0
# FROM quay.io/openshift/origin-jenkins-agent-base:4.6.0
FROM openshift/jenkins-slave-base-centos7
MAINTAINER Yannick Scherer <yannick.scherer@futurice.com>

RUN yum-config-manager --disable \
    rhel-fast-datapath \
    rhel-fast-datapath-beta \
    rhel-server \
    rhel-server-extras \
    rhel-server-optional \
    rhel-server-ose \
    rhel-server-rhscl

RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash - && \
    curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo && \
    # yum check-update && \
    yum install -y nodejs yarn && \
    yum clean all -y && \
    chown -R 1001:0 $HOME && \
    chmod -R g+rw $HOME

USER 1001
