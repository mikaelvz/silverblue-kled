ARG RELEASE=40

FROM quay.io/fedora-ostree-desktops/silverblue:${RELEASE}

COPY build.sh /tmp/build.sh

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
