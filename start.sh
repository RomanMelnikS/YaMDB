#!/bin/sh
pip install -r requirements.txt

python manage.py collectstatic --noinput
python manage.py makemigrations api
python manage.py migrate
python manage.py loaddata fixtures.json

gunicorn api_yamdb.wsgi:application --bind 0.0.0.0
