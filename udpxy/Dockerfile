#Based on official wireguard addon
ARG BUILD_FROM=hassioaddons/base:4.1.1
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
# hadolint ignore=DL3003
RUN \
    apk add --no-cache --virtual .build-dependencies \
        build-base=0.5-r1 \
        git=2.22.2-r0 \
    \
    && git clone --branch "1.0-24.1" --depth=1 \
        "https://github.com/pcherenkov/udpxy" /tmp/udpxy \
    \
    && cd /tmp/udpxy/chipmunk \
    && make \
    && make install \
    \
    && rm -f -r /tmp/* \
    && apk del --no-cache --purge \
        .build-dependencies

# Copy root filesystem
COPY rootfs /

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="udpxy" \
    io.hass.description="UDP proxy" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Jose Carlos Luna <Jose.Carlos.Luna@gamil.com>" \
    org.label-schema.description="UDP proxy" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="udpxy" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://github.com/dreyercito/addon-udpxy/tree/master/README.md" \
    org.label-schema.usage="https://github.com/dreyercito/addon-udpxy/tree/master/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/dreyercito/addon-udpxy" \
    org.label-schema.vendor="Dreyer Hass.io Add-ons"
