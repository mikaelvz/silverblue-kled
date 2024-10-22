ARG RELEASE=40

FROM ghcr.io/ublue-os/config:latest AS ublue-os-config

FROM quay.io/fedora-ostree-desktops/silverblue:${RELEASE}
COPY system /
COPY --from=ublue-os-config /rpms /tmp/ublue-os/config/rpms

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
