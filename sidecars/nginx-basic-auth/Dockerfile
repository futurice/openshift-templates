FROM openshift/base-centos7
MAINTAINER "Yannick Scherer <yannick.scherer@futurice.com>"

# --------------------
# METADATA
# --------------------
EXPOSE 8087
ENV NGINX_VERSION=1.12.2 \
    PORT=8087 \
    FORWARD_PORT=8080

# --------------------
# BUILD DEPENDENCIES
# --------------------
RUN yum install -y epel-release && \
        yum install -y nginx-${NGINX_VERSION} python-pip
RUN pip install envtpl && \
        yum clean all && \
        chown -R 1001:1001 /var/log/nginx && \
        chmod g+rw /var/run /var/log/nginx /etc/nginx/ /etc/nginx/conf.d
COPY default.conf.tpl /etc/nginx/conf.d/default.conf.tpl
COPY nginx.conf auth.htpasswd.tpl /etc/nginx/

# --------------------
# BUILD LOGIC
# --------------------
CMD id && \
    envtpl /etc/nginx/conf.d/default.conf.tpl && \
    envtpl /etc/nginx/auth.htpasswd.tpl && \
    nginx
