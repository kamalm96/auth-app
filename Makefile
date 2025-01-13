postgres:
	docker run --name auth-app -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres
createdb:
	docker exec -it auth-app createdb --username=root --owner=root authapp

dropdb:
	docker exec -it auth-app dropdb --username=root --owner=root authapp

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/authapp?sslmode=disable" -verbose up
migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/authapp?sslmode=disable" -verbose down
sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go
.PHONY: postgres createdb dropdb migrateup migratedown test server