# Monorepo
Complete dev/prod architecture for comfortable development frontend/backend using docker containerisation.

## Initialize environment files
```
cp .env.example .env
```

## Backend
```
docker compose -f docker-compose.dev.yml --profile client watch
```

## Frontend
```
docker compose -f docker-compose.dev.yml --profile core watch
```

## Backend+Frontend
```
docker compose -f docker-compose.dev.yml --profile all watch
```
