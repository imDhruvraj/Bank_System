postgres:
	docker	run	--name	postgres14	-p	5432:5432	-e	POSTGRES_USER=dhruv	-e POSTGRES_PASSWORD=dhruv	-d	postgres:14

createdb:
	docker exec -it postgres14 createdb --username=dhruv --owner=dhruv simple_bank

dropdb:
	docker exec -it postgres14 dropdb -U dhruv simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://dhruv:dhruv@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://dhruv:dhruv@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY:	postgtres	createdb	dropdb	migrateup	migratedown	sqlc	test