pip install -r requirements.txt

gunicorn api_yamdb.wsgi:application --bind 0.0.0.0

python manage.py collectstatic --noinput
python manage.py makemigrations api --noinput
python manage.py migrate --noinput
python manage.py loaddata fixtures.json
