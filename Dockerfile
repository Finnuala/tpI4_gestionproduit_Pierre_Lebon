FROM php:5-apache
COPY ./www /var/www/html
RUN apt-get update && apt-get install zip unzip
RUN docker-php-ext-install mysqli
RUN curl -sS https://getcomposer.org/download/1.7.2/composer.phar -o /usr/local/bin/composer && chmod +x /usr/local/bin/composer
COPY ./www /var/www/html
WORKDIR /var/www/html
RUN composer require aws/aws-sdk-php --dev --update-with-dependencies
