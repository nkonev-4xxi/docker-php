# Desciption
PHP image with Composer and optimized for Symfony projects.

# Usage
```Yaml
php:
    build: 4xxi/php:7.2.2-fpm-alpine3.7
    volumes:
        - .:/var/www/app
    expose:
        - "9000"
    environment:
        APP_ENV: ${APP_ENV}
```
