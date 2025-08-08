#!/usr/bin/env bash
set -euo pipefail
: "${DATABASE_URL:=postgresql+psycopg://postgres:postgres@localhost:5432/vibe}"
psql "$DATABASE_URL" -f infra/postgres/init.sql
echo "DB initialized."
