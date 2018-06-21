FROM openshift/jenkins-slave-base-centos7
MAINTAINER Yannick Scherer <yannick.scherer@futurice.com>

RUN yum update -y \
        && yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel \
        && yum clean all

RUN export PATH=/usr/lib/jvm/java/bin:$PATH && java -version \
        && curl -sL https://raw.github.com/technomancy/leiningen/2.8.1/bin/lein > /usr/local/bin/lein \
        && chmod a+x /usr/local/bin/lein \
        && lein version

USER 1001
