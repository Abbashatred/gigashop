# Gigashop

## Запуск через Docker

1. Создайте env-файл:

```bash
cp .env.example .env
```

2. Соберите и запустите контейнеры:

```bash
docker compose up --build
```

3. Приложение будет доступно на `http://localhost:8000`.

## Что настроено

- `web` сервис запускает Django + Gunicorn.
- При старте автоматически выполняются `migrate` и `collectstatic`.
- `db` сервис — PostgreSQL 16.
- Настройки проекта читаются из `.env`.
