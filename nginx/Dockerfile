FROM python:3.12.7-slim-bullseye

WORKDIR /usr/src/app

# Don't write pyc files to disc
ENV PYTHONDONTWRITEBYTECODE 1
# Don't buffer stout and stderr
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY ./. .

RUN python manage.py collectstatic --no-input --clear


FROM nginx:1.25

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d
COPY --from=0 /usr/src/app/staticfiles /home/app/web/staticfiles