
ARG PHP_VERSION=8.5.3
ARG PHP_EXTENSIONS="pdo_mysql zip intl mbstring sockets opcache bcmath xsl apcu amqp gd redis xdebug sysvsem"

FROM php:${PHP_VERSION}-fpm

# Args in Stage verfügbar machen
ARG PHP_EXTENSIONS

# Helper holen
COPY --from=mlocati/php-extension-installer:2 /usr/bin/install-php-extensions /usr/local/bin/

SHELL ["/bin/bash", "-exo", "pipefail", "-c"]

ENV TZ=UTC \
    DEBIAN_FRONTEND=noninteractive \
    COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_MEMORY_LIMIT=-1 \
    COMPOSER_HOME=/var/www/.composer \
    COMPOSER_CACHE_DIR=/var/www/.composer/cache \
    APP_ENV=dev \
    APP_DEBUG=1 \
    HOME=/var/www

# Dev-Pakete
RUN apt-get update && apt-get install -y --no-install-recommends \
      git curl unzip zip vim nano default-mysql-client \
      librabbitmq-dev libicu-dev libzip-dev libxslt1-dev libpng-dev libjpeg-dev libfreetype6-dev libwebp-dev \
    && rm -rf /var/lib/apt/lists/*

# EINZIGER Extensions-Call – nur ausführen, wenn nicht leer
RUN if [ -n "${PHP_EXTENSIONS}" ]; then \
      echo "Installing PHP extensions: ${PHP_EXTENSIONS}"; \
      install-php-extensions ${PHP_EXTENSIONS}; \
    else \
      echo "No PHP extensions to install"; \
    fi

# Eigene .ini-Dateien (xdebug.ini etc.)
COPY ./templates/*.ini /usr/local/etc/php/conf.d/

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /code

# In dev gern als www-data laufen lassen, damit var/… beschreibbar ist
USER www-data

EXPOSE 9000
CMD ["php-fpm"]
