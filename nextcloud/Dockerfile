ARG BUILD_FROM
FROM $BUILD_FROM
ARG BUILD_ARCH

COPY run_addon.sh /
RUN chmod a+x /run_addon.sh

ENTRYPOINT [ "/run_addon.sh" ]
#CMD ["apache2-foreground"]
