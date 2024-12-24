# list of args
ARG COMPOSER_VERSION=2
ARG PHP_VERSION=8.3

# build composer
FROM composer:${COMPOSER_VERSION} AS composer

# build php
FROM php:${PHP_VERSION}-fpm AS php

# install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq-dev \
    libzip-dev \
    libicu-dev \
    zip \
    unzip \
    curl \
    && rm -rf /var/lib/apt/lists/*

# install and enable php-extensions
RUN docker-php-ext-install mysqli zip intl pdo opcache pdo_mysql

# Zusätzliche Extensions via PECL
RUN pecl install xdebug redis \
    && docker-php-ext-enable xdebug redis

# Symfony CLI installieren
RUN curl -sS https://get.symfony.com/cli/installer | bash && mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

## Composer aus dem Composer-Image kopieren
COPY --from=composer /usr/bin/composer /usr/local/bin/composer

# PHP-INI-Anpassungen laden (z. B. eigene ini-Dateien für xdebug, memory_limit etc.)
COPY ./templates/*.ini /usr/local/etc/php/conf.d/

## Setze Dateirechte
#RUN chown -R www-data:www-data /var/www/html

# set working directory
WORKDIR  /code

# port
EXPOSE 9000
