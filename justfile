#!/usr/bin/env just --justfile

set shell := ["bash", "-uc"]

# default recipe to display help information
default:
  @just --list

# Initialize environment variables
env:
    cp .env.example .env

# Delete files ignored by git
clean:
  git clean -Xdf

up profile="all" compose="docker-compose.dev.yml":
  docker compose -f {{compose}} --profile {{profile}} up -d --build

build service compose="docker-compose.dev.yml":
  docker compose -f {{compose}} build --no-cache {{service}}

down compose="docker-compose.dev.yml":
  docker compose -f {{compose}} down

nuke compose="docker-compose.dev.yml":
  docker compose -f {{compose}} down -v --remove-orphans

watch profile="all" compose="docker-compose.dev.yml":
  docker compose -f {{compose}} --profile {{profile}} up --watch
