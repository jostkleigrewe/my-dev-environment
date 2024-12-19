# list of args
ARG COMPOSER_VERSION
ARG PHP_VERSION

# build composer
FROM composer:${COMPOSER_VERSION} as composer

# build php
FROM php:${PHP_VERSION}-fpm as php

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

# Composer aus dem Composer-Image kopieren
COPY --from=composer /usr/bin/composer /usr/local/bin/composer

# PHP-INI-Anpassungen laden (z. B. eigene ini-Dateien für xdebug, memory_limit etc.)
COPY ./templates/*.ini /usr/local/etc/php/conf.d/

# set working directory
WORKDIR  /


# port
EXPOSE 9000
