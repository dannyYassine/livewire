env.install:
	if [ ! -f ./api/.env ]; then cp ./api/.env.example ./api/.env; fi
	if [ ! -f ./api/database/database.sqlite ]; then touch ./api/database/database.sqlite; fi
	docker compose up -d
	while [ "$(docker exec -t api echo "Is running")" != "" ]; do sleep 2; done
	docker exec -it livewire-api composer install --ignore-platform-reqs
	docker exec -it livewire-api yarn
	docker exec -it livewire-api php artisan key:generate
	docker exec -it livewire-api php artisan octane:install --server=frankenphp -n
	docker exec -it livewire-api php artisan migrate:fresh --force
	docker exec -it livewire-api php artisan db:seed --force
	docker compose stop

env.reset:
	docker compose down
	rm -rf ./api/vendor
	rm -rf ./api/node_modules
	make install.env

up:
	docker compose up -d

down:
	docker compose stop
