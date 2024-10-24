FROM ghcr.io/ublue-os/silverblue-main:latest

COPY system /

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
