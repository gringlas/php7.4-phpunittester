FROM php:7.4-cli

RUN pecl install xdebug \
      && docker-php-ext-enable xdebug
RUN echo "xdebug.mode=coverage" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN apt-get update -yqq
RUN apt-get install git -yqq
RUN apt-get install libzip-dev -yqq
RUN apt-get install libpng-dev -yqq
RUN apt-get install libicu-dev -yqq
# zip is used in lessonimporter testcases
RUN apt-get install zip -yqq
# Install php extensions
RUN docker-php-ext-install pdo_mysql zip gd intl
# Install composer
RUN curl -sS https://getcomposer.org/installer | php
# make composer.phar available as composer
RUN mv composer.phar /usr/local/bin/composer
