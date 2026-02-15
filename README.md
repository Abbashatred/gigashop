# Gigashop 🛒

Gigashop is a Django-based ecommerce project running in Docker with PostgreSQL, Gunicorn, Nginx, Stripe payments, and **uv** for Python dependency management.
Designed for local development, testing, and portfolio demonstration.

---

## 🚀 Tech Stack

* Django 6+
* PostgreSQL
* Docker & Docker Compose
* Gunicorn + Nginx
* Stripe payment integration
* uv (modern Python package manager)

---

## ⚙️ Local Setup (Docker)

### 1. Clone the repository

```bash
git clone https://github.com/Abbashatred/gigashop.git && cd gigashop
```

---

### 2. Copy a `.env` file

```bash
cp .env.example .env
```
---

### 3. Build and run containers

```bash
docker compose up --build -d
```

Once running:

* Website → http://localhost
* Admin panel → http://localhost/admin

---

## 👤 Create Admin User

```bash
docker compose exec web uv run python manage.py createsuperuser
```

Then log in at:

```
http://localhost/admin
```
---

## 🖼 Static & Media Files

* Static files are collected automatically (`collectstatic`)
* Product images are stored in:

```
media/
```

If you clone the repo, ensure demo images exist or add your own.

---

## 💳 Stripe Testing

Use Stripe test card:

```
4242 4242 4242 4242
Exp: any future date
CVC: any 3 digits
```

(Stripe test mode only.)

---

## 🐳 Docker Services

### `web`

* Django app running via Gunicorn
* Handles backend logic

### `db`

* PostgreSQL database container

### `nginx`

* Reverse proxy
* Serves static and media files

---

## 🧪 Useful Commands

### Stop containers

```bash
docker compose down
```

---

### Restart with rebuild

```bash
docker compose up --build
```

---

### Run migrations manually

```bash
docker compose exec web uv run python manage.py migrate
```

---

### Open Django shell

```bash
docker compose exec web uv run python manage.py shell
```