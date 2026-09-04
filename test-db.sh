#!/bin/bash

set -e

echo "Waiting for PostgreSQL..."

until pg_isready -h "$DB_HOST" -p 5432 -U "$DB_USER"
do
  sleep 2
done

echo "Connected."

export PGPASSWORD="$DB_PASSWORD"

psql \
  -h "$DB_HOST" \
  -U "$DB_USER" \
  -d "$DB_NAME" \
  <<EOF

CREATE TABLE IF NOT EXISTS customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

INSERT INTO customers(name)
VALUES ('GitHub Actions Demo');

SELECT * FROM customers;

EOF
