# Use the official PHP image with the desired version
FROM php:8.0-fpm

# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    && docker-php-ext-install pdo pdo_mysql

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the Laravel application code into the container
COPY . /var/www/html

# Install application dependencies using Composer
RUN composer install

# Expose the port that PHP-FPM will listen on
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]

# You can add more configurations and optimizations as needed for your Laravel application
