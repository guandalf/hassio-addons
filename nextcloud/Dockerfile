ARG BUILD_FROM
FROM $BUILD_FROM
ARG BUILD_ARCH

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.name="NextcloudPi Hassio addon" \
        org.label-schema.description="Addon to run a NextcloudPi instance on Hassio based systems" \
#        org.label-schema.url="e.g. https://www.example.com/" \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/guandalf/hassio-addons" \
        org.label-schema.vendor="Stefano Guandalini <guandalf@gmail.com>" \
        org.label-schema.version=$VERSION \
        org.label-schema.schema-version="1.0"

COPY run_addon.sh /
RUN chmod a+x /run_addon.sh

ENTRYPOINT [ "/run_addon.sh" ]
