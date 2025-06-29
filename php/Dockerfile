FROM php:8.1-fpm

# Installer dépendances
RUN apt-get update && apt-get install -y \
    git unzip curl zip netcat-traditional

# L'installation de node par apt ne fonctionne pas du coup on passe par le dépôt officiel NodeSource
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# Installer les extensions PHP pdo et pdo_mysql
RUN docker-php-ext-install pdo pdo_mysql

# Installer Composer pour les dépendances de php
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# Installer Node (optionnel si non déjà installé)
RUN npm install -g npm

# Copie du script de démarrage
COPY start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /var/www/html
