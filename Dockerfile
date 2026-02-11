FROM php:8.1-apache

RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

RUN a2enmod rewrite

COPY . /var/www/html/

# change ownership to www-data
RUN chown -R www-data:www-data /var/www/html

# permission 755
RUN chmod -R 755 /var/www/html