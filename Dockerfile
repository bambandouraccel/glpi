FROM docker.io/glpi/glpi:latest

USER root

COPY init-volumes-directories.sh /opt/glpi/entrypoint/init-volumes-directories.sh
RUN chmod +x /opt/glpi/entrypoint/init-volumes-directories.sh

RUN mkdir -p /var/glpi/config && \
    chown -R 1001:0 /var/glpi && \
    chmod -R g+rw /var/glpi

RUN chmod +x /opt/glpi/entrypoint.sh && \
    chmod -R +x /opt/glpi/entrypoint/

USER 1001

ENTRYPOINT ["/opt/glpi/entrypoint.sh"]
CMD ["apache2-foreground"]
