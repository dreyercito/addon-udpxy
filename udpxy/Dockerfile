ARG BUILD_FROM
FROM $BUILD_FROM
# hadolint ignore=DL3003
RUN \
    apk add --no-cache --virtual .build-dependencies \
        build-base=0.5-r3 \
        git=2.45.1-r0 \
    \
    && git clone --branch "1.0-25.1" --depth=1 \
        "https://github.com/pcherenkov/udpxy" /tmp/udpxy \
    \
    && cd /tmp/udpxy/chipmunk \
    && make \
    && make install \
    \
    && rm -f -r /tmp/* \
    && apk del --no-cache --purge \
        .build-dependencies

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]



