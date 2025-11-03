alias b := build
alias w := watch
alias d := down
alias n := nuke

set shell := ["sh", "-c"]

_default:
    @just --list --unsorted --list-prefix "···· "

# Initialize environment variables
env:
    cp .env.example .env

# Delete files ignored by `git`
clean:
    git clean -Xdf

build profile="all" compose="docker-compose.dev.yml":
    docker compose -f {{ compose }} --profile {{profile}} build --no-cache

up profile="all" compose="docker-compose.dev.yml":
    docker compose -f {{ compose }} --profile {{ profile }} up -d

watch profile="all" compose="docker-compose.dev.yml":
    docker compose -f {{ compose }} --profile {{ profile }} up --watch

down profile="all" compose="docker-compose.dev.yml":
    docker compose -f {{ compose }} --profile {{ profile }} down

nuke profile="all" compose="docker-compose.dev.yml":
    docker compose -f {{ compose }} --profile {{ profile }} down -v --remove-orphans
