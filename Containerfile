ARG RELEASE=40

FROM quay.io/fedora-ostree-desktops/silverblue:${RELEASE}

ARG IMAGE_NAME="silverblue-kled"
ARG IMAGE_REGISTRY="ghcr.io/mikaelvz"

COPY system /

COPY cosign.pub /usr/etc/pki/containers/${IMAGE_NAME}.pub

RUN mkdir -p /var/lib/alternatives && \
    # Signing
    /tmp/scripts/signing.sh && \
    ostree container commit
