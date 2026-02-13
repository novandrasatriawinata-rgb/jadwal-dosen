#!/bin/bash
set -e

# This script runs on every deployment.

echo "--- Preparing application for production ---"

# Clear any cached configuration, routes, or views.
# This is crucial to ensure the latest environment variables are used.
php artisan config:clear
php artisan route:clear
php artisan view:clear

# Run database migrations to ensure the schema is up to date.
php artisan migrate --force

# Seed the database with initial data (users, schedules, etc.).
php artisan db:seed --force

echo "--- Starting application server ---"
php artisan serve --host=0.0.0.0 --port=$PORT
