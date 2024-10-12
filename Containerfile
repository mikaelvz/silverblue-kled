FROM ghcr.io/ublue-os/silverblue-main:latest

COPY cros.conf build.sh /tmp

RUN /tmp/build.sh && \
    ostree container commit