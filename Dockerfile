FROM python:3.10

WORKDIR /app

# install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copy project
COPY . .

# collect static files (optional but recommended)
RUN python manage.py collectstatic --noinput

EXPOSE 8000

# use gunicorn instead of runserver
CMD ["gunicorn", "django_todo.wsgi:application", "--bind", "0.0.0.0:8000"]
