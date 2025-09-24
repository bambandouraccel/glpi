FROM docker.io/glpi/glpi:latest

# Variables d'environnement par défaut
ENV GLPI_DB_HOST=mariadb \
    GLPI_DB_PORT=3306 \
    GLPI_DB_NAME=glpi \
    GLPI_DB_USER=glpi \
    GLPI_DB_PASSWORD=glpi

USER root

# Copier le script d'init
COPY init-volumes-directories.sh /opt/glpi/entrypoint/init-volumes-directories.sh
RUN chmod +x /opt/glpi/entrypoint/init-volumes-directories.sh

# Préparer les répertoires avec GID 0 (root group) -> compatible OpenShift
RUN mkdir -p /var/glpi/config /var/glpi/files /var/glpi/log /var/glpi/plugins && \
    chgrp -R 0 /var/glpi && \
    chmod -R g+rwX /var/glpi

# S'assurer que tout l'entrypoint est exécutable
RUN chmod +x /opt/glpi/entrypoint.sh && \
    chmod -R +x /opt/glpi/entrypoint/

# Passer à un utilisateur non-root (aléatoire sur OpenShift mais toujours GID 0)
USER 1001

ENTRYPOINT ["/opt/glpi/entrypoint.sh"]
CMD ["apache2-foreground"]

