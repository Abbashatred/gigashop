FROM python:3.14-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    gettext \
    && rm -rf /var/lib/apt/lists/*

RUN pip install uv

COPY pyproject.toml uv.lock .python-version ./

RUN uv sync --frozen --no-dev

COPY . .

CMD ["sh", "-c", "uv run python manage.py migrate && uv run gunicorn gigashop.wsgi:application --bind 0.0.0.0:8000"]
