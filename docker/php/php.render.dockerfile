FROM composer:latest as composer
FROM node:20
FROM php:8.2

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

# install yarn
RUN npm install -g yarn

COPY ./api .

RUN yarn

RUN composer install --ignore-platform-reqs

# RUN php artisan key:generate
RUN php artisan octane:install --server=frankenphp -n
# RUN php artisan migrate:fresh --force
# RUN php artisan db:seed --force

CMD php artisan octane:frankenphp --workers=4 --max-requests=10 --host=0.0.0.0 --port=$PORT