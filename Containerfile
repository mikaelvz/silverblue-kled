ARG RELEASE=40

FROM quay.io/fedora-ostree-desktops/silverblue:${RELEASE}

COPY system /

COPY --from=ghcr.io/ublue-os/config:latest /rpms /tmp/ublue-os/config/rpms

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
