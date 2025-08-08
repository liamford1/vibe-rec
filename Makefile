up:
	docker compose up -d
down:
	docker compose down
logs:
	docker compose logs -f --tail=200
db-init:
	./scripts/init_db.sh
