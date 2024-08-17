FROM mcr.microsoft.com/playwright:v1.46.0-jammy

WORKDIR /usr/src/client

COPY ./client/package.json ./
COPY ./client/yarn.lock ./

COPY ./client .