FROM php:8.1-fpm

RUN apt-get update && apt-get install -y \
    git unzip curl zip netcat-traditional

# l'installation de node par apt ne fonctionne pas du coup on passe par le dépôt officiel NodeSource
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# extensions PHP
RUN docker-php-ext-install pdo pdo_mysql

# Installer Composer pour les dépendances de php
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# copie du script de démarrage
COPY start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /var/www/html
