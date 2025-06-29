#!/bin/bash

# attendre mysql
until nc -z -v -w30 mysql 3306; do
  echo "Waiting for MySQL connection..."
  sleep 2
done

composer install
npm install
npm run build
php artisan key:generate

# on ne fait la migration que si l'argument --migrate est passé
if [ "$1" = "--migrate" ]; then
  php artisan migrate:fresh --seed
fi

php-fpm
