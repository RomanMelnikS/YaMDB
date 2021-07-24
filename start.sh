pip install -r requirements.txt

gunicorn api_yamdb.wsgi:application --bind 0.0.0.0

docker-compose exec web python manage.py collectstatic --noinput
docker-compose exec web python manage.py makemigrations api --noinput
docker-compose exec web python manage.py migrate --noinput
docker-compose exec web python manage.py loaddata fixtures.json
