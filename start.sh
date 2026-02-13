#!/bin/bash
set -e

echo "Clearing caches..."
php artisan config:clear
php artisan route:cache
php artisan view:cache
php artisan cache:clear

echo "Starting application..."
php artisan serve --host=0.0.0.0 --port=$PORT
