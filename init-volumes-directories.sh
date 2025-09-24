#!/bin/bash
set -e

echo "[INIT] Initialisation des volumes et répertoires GLPI..."

# Répertoires de configuration et de données
GLPI_VAR_DIR="/var/glpi"
GLPI_CONFIG_DIR="${GLPI_VAR_DIR}/config"
GLPI_FILES_DIR="${GLPI_VAR_DIR}/files"
GLPI_LOG_DIR="${GLPI_VAR_DIR}/log"
GLPI_PLUGIN_DIR="${GLPI_VAR_DIR}/plugins"

# Création des répertoires si absents
mkdir -p "$GLPI_CONFIG_DIR" "$GLPI_FILES_DIR" "$GLPI_LOG_DIR" "$GLPI_PLUGIN_DIR"

# Droits (1001 = utilisateur non root)
chown -R 1001:0 "$GLPI_VAR_DIR"
chmod -R g+rw "$GLPI_VAR_DIR"

echo "[INIT] Répertoires GLPI initialisés avec succès."

