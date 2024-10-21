FROM quay.io/fedora-ostree-desktops/silverblue:40

COPY system_files/overrides /

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit