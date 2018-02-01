FROM php:7.1-fpm-alpine

COPY ./symfony.ini /usr/local/etc/php/conf.d
COPY ./symfony.pool.conf /usr/local/etc/php-fpm.d/

RUN apk update && apk add \
    git \
    icu-dev \
    libmcrypt-dev \
    zlib-dev

RUN docker-php-ext-install \
    bcmath \
    intl \
    mcrypt \
    opcache \
    pdo \
    zip

# https://getcomposer.org/doc/03-cli.md#composer-allow-superuser
ENV COMPOSER_ALLOW_SUPERUSER 1

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && chmod +x /usr/local/bin/composer

# RUN adduser -D -u 1000 www-data
