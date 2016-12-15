FROM php:7.1-fpm

COPY ./symfony.ini /usr/local/etc/php/conf.d
COPY ./symfony.pool.conf /usr/local/etc/php-fpm.d/

RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libicu-dev \
    libmcrypt-dev\
    git

RUN docker-php-ext-install \
    pdo \
    bcmath \
    intl \
    mcrypt \
    zip
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && chmod +x /usr/local/bin/composer

RUN usermod -u 1000 www-data
