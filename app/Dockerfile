FROM python:3.13-slim AS base

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONPATH=/app

WORKDIR /app

# System deps for psycopg (binary includes libpq, but tzdata is useful)
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl tzdata && rm -rf /var/lib/apt/lists/*

# Install Python deps
COPY pyproject.toml /app/pyproject.toml
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir fastapi "uvicorn[standard]" sqlalchemy "psycopg[binary]" alembic passlib[bcrypt] pydantic pydantic-settings python-dotenv

# Copy app code and alembic
COPY . /app

EXPOSE 8000

CMD ["sh", "-c", "alembic upgrade head && uvicorn src.main:app --host 0.0.0.0 --port 8000"]
