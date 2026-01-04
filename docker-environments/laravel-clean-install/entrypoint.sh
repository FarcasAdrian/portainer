#!/bin/sh

# Stop execution if migration fails and print the actual error.
set -e

# Replace default laravel .env configuration with Portainer variables
sed -i "s|APP_URL=.*|APP_URL=${LARAVEL_URI}:${LARAVEL_PORT}|g" .env
sed -i "s|DB_CONNECTION=.*|DB_CONNECTION=${DB_CONNECTION}|g" .env
sed -i "s|# DB_HOST=.*|DB_HOST=${DB_HOST}|g" .env
sed -i "s|# DB_PORT=.*|DB_PORT=${MYSQL_TCP_PORT}|g" .env
sed -i "s|# DB_DATABASE=.*|DB_DATABASE=${MYSQL_DATABASE}|g" .env
sed -i "s|# DB_USERNAME=.*|DB_USERNAME=${MYSQL_USERNAME}|g" .env
sed -i "s|# DB_PASSWORD=.*|DB_PASSWORD=${MYSQL_PASSWORD}|g" .env

# Wait for Database to be up and ready
echo "Waiting for database..."
until nc -z ${DB_HOST} ${MYSQL_TCP_PORT}; do
  sleep 1
done
echo "Database is up!"

# Run migrations
php artisan migrate

# Start Laravel server
php artisan serve --host=0.0.0.0 --port=${LARAVEL_PORT}
