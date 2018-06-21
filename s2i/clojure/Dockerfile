FROM openshift/base-centos7

# --------------------
# METADATA
# --------------------
LABEL maintainer="Yannick Scherer <yannick.scherer@futurice.com>"

ENV BUILDER_VERSION=1.0 \
    LEININGEN_VERSION=2.8.1 \
    JDK_PACKAGE=java-1.8.0-openjdk-devel

LABEL io.k8s.description="Platform for building Clojure applications" \
      io.k8s.display-name="Clojure Builder 1.0.0" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,clojure"

# --------------------
# BUILD DEPENDENCIES
# --------------------
RUN yum install -y $JDK_PACKAGE && \
        yum clean all -y && \
        curl https://raw.githubusercontent.com/technomancy/leiningen/${LEININGEN_VERSION}/bin/lein > /usr/bin/lein && \
        chmod 775 /usr/bin/lein && \
        lein version

# --------------------
# BUILD LOGIC
# --------------------
COPY ./s2i/bin/ /usr/libexec/s2i
USER 1001
EXPOSE 8080
CMD ["/usr/libexec/s2i/usage"]
