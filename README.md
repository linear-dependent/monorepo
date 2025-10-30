# Monorepo

Монорепозиторий для быстрого старта фронтенда и бэкенда в Docker:

- Фронтенд: React + Vite
- Бэкенд: FastAPI (Python)
- База: PostgreSQL + pgAdmin

Все сервисы управляются через Docker Compose (профили) и `just`.

## Требования

- Docker и Docker Compose v2
- `just` установлен в системе (https://github.com/casey/just)

## Быстрый старт

- Инициализировать переменные окружения:

  ```
  just env
  ```

  (создаст `.env` из `.env.example`).

- Запуск в режиме разработки (live reload):
  - Все сервисы:
    ```
    just watch
    ```
  - Бэкенд (API + DB + pgAdmin):
    ```
    just watch core
    ```
  - Только фронтенд:
    ```
    just watch client
    ```

## Урлы

- Профили Compose: `all` (по умолчанию), `core` (backend), `client` (frontend)
- URL по умолчанию:
  - API: `http://localhost:8000`
  - Frontend: `http://localhost:5173`
  - pgAdmin: `http://localhost:70` (см. `.env`)
