FROM composer:latest as composer
FROM node:20
FROM php:8.2-fpm

WORKDIR /usr/src/api

# install node and npm
COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=node /usr/local/bin/node /usr/local/bin/node
RUN ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm

# copy composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

# install packages
RUN apt-get update
RUN apt-get install -y libpq-dev git zip unzip supervisor

# install php extensions and libs
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install pdo pgsql pdo_pgsql
RUN pecl install xdebug

# enable php extensions
RUN docker-php-ext-enable xdebug

# install yarn
RUN npm install -g yarn

COPY ./api .