#!/usr/bin/env just --justfile

set shell := ["bash", "-uc"]

# default recipe to display help information
default:
  @just --list

# Initialize environment variables
env:
    cp .env.example .env

# Confirm auto lint action
confirm-lint:
  git add .
  !!

# Delete files ignored by git
clean:
  git clean -Xdf

# Variables
compose := "docker-compose.dev.yml"

# Compose helpers
up-core:
  docker compose -f {{compose}} --profile core up -d --build

up-client:
  docker compose -f {{compose}} --profile client up -d --build

up:
  docker compose -f {{compose}} --profile all up -d --build

down:
  docker compose -f {{compose}} down

nuke:
  docker compose -f {{compose}} down -v --remove-orphans

rebuild service:
  docker compose -f {{compose}} build --no-cache {{service}}

migrate:
  docker compose -f {{compose}} run --rm migrations

# Live watch using Compose develop.watch
watch-core:
  # Watch API (migrations run first via depends_on)
  docker compose -f {{compose}} --profile core watch

watch-client:
  # Watch Vite dev server (frontend)
  docker compose -f {{compose}} --profile client watch

watch:
  # Watch API and Client together
  docker compose -f {{compose}} --profile all up watch
