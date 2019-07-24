FROM openshift/base-centos7

# --------------------
# METADATA
# --------------------
LABEL maintainer="Yannick Scherer <yannick.scherer@futurice.com>"

ENV BUILDER_VERSION=1.0.0 \
        NODE_VERSION=10.16.0 \
        YARN_VERSION=1.16.0 \
        YARN_RUN="yarn server" \
        RUN_NODE_ENV=production

LABEL io.k8s.description="Platform for building yarn applications that provide a server" \
        io.k8s.display-name="Yarn Server Builder 1.0.0" \
        io.openshift.expose-services="8080:http" \
        io.openshift.tags="builder,typescript,yarn"

# --------------------
# BUILD DEPENDENCIES
# --------------------
RUN curl -sL https://dl.yarnpkg.com/rpm/yarn.repo > /etc/yum.repos.d/yarn.repo && \
        curl -sL https://rpm.nodesource.com/setup_10.x | bash -
RUN yum install -y nodejs-${NODE_VERSION} yarn-${YARN_VERSION} && \
        yum clean all && \
        yarn --version && \
        node --version

# --------------------
# BUILD LOGIC
# --------------------
COPY ./s2i/bin/ /usr/libexec/s2i
USER 1001
EXPOSE 8080
CMD ["/usr/libexec/s2i/usage"]
