FROM php:7.1-fpm

COPY ./symfony.ini /usr/local/etc/php/conf.d
COPY ./symfony.pool.conf /usr/local/etc/php-fpm.d/

RUN apt-get update && apt-get install -y \
    git \
    libicu-dev \
    zlib1g-dev

RUN docker-php-ext-install \
    bcmath \
    intl \
    opcache \
    pdo \
    zip

ENV COMPOSER_ALLOW_SUPERUSER 1
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && chmod +x /usr/local/bin/composer

ENV DOCKER_HOST_USER_ID 1000
RUN usermod -u ${DOCKER_HOST_USER_ID} www-data