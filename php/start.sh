#!/bin/bash

# attendre mysql
until nc -z -v -w30 mysql 3306; do
  echo "Waiting for MySQL connection..."
  sleep 2
done

composer install
npm install
npm run build

# générer la clé et migrer seulement si APP_KEY n'est pas défini dans le .env
if ! grep -q '^APP_KEY=base64:' .env || grep -q '^APP_KEY=$' .env; then
  php artisan key:generate
  # on ne fait la migration que si l'argument --migrate est passé
  if [ "$1" = "--migrate" ]; then
    php artisan migrate:fresh --seed
  fi
fi
 
php-fpm
