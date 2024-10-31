FROM python:3.12.7-slim-bullseye

WORKDIR /usr/src/app

# Don't write pyc files to disc
ENV PYTHONDONTWRITEBYTECODE 1
# Don't buffer stout and stderr
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY . .