FROM openshift/base-centos7

# --------------------
# METADATA
# --------------------
LABEL maintainer="Yannick Scherer <yannick.scherer@futurice.com>"

ENV BUILDER_VERSION=1.0.0 \
    NODE_VERSION=8.11.3 \
    YARN_VERSION=1.6.0 \
    NGINX_VERSION=1.12.2

LABEL io.k8s.description="Platform for building static webpages based on yarn" \
      io.k8s.display-name="Static Webpage Builder (yarn) 1.0.0" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,typescript,yarn"

# --------------------
# BUILD DEPENDENCIES
# --------------------
RUN curl -sL https://dl.yarnpkg.com/rpm/yarn.repo > /etc/yum.repos.d/yarn.repo && \
        curl -sL https://rpm.nodesource.com/setup_8.x | bash - && \
        yum install -y epel-release
RUN yum install -y nginx-${NGINX_VERSION} nodejs-${NODE_VERSION} yarn-${YARN_VERSION} python-pip && \
        pip install envtpl && \
        yum clean all && \
        mkdir -p /opt/cache && \
        chown -R 1001:1001 /var/log/nginx /opt/cache && \
        chmod g+rw /var/run /opt/app-root && \
        yarn --version && \
        node --version
COPY default.conf.tpl /etc/nginx/conf.d/default.conf.tpl
COPY nginx.conf /etc/nginx/nginx.conf
RUN chmod -R a+w /etc/nginx/conf.d

# --------------------
# BUILD LOGIC
# --------------------
COPY ./s2i/bin/ /usr/libexec/s2i
USER 1001
EXPOSE 8080
CMD ["/usr/libexec/s2i/usage"]
