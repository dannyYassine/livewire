# livewire

## Inside the `api` container

### first command

```bash
composer create-project laravel/laravel example-app
```

### installing project

```bash
composer install --ignore-platform-reqs
yarn
```

```bash
composer require livewire/livewire
```

```bash
composer require laravel/octane
```

```bash
curl -Lo frankenphp https://github.com/frankenphp/frankenphp/releases/latest/download/frankenphp-linux
chmod +x frankenphp
sudo mv frankenphp /usr/local/bin/
frankenphp --version
```

```bash
php artisan octane:install --server=frankenphp -n
```

```bash
docker exec -it livewire-api php artisan octane:frankenphp --workers=4 --max-requests=10 --host=0.0.0.0 --port=8000 --watch
```
