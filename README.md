# Desciption
PHP image optimized for Symfony Flex projects.

# Usage
```Yaml
php:
    build: 4xxi/php:flex
    volumes:
        - .:/var/www/html
    expose:
        - "9000"
    environment:
        APP_ENV: ${APP_ENV}
```