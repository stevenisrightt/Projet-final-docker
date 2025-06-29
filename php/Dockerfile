FROM php:8.2-fpm

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    git curl zip unzip nodejs npm \
    && docker-php-ext-install pdo pdo_mysql \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www

# Installer Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Installer les dépendances Laravel automatiquement
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
