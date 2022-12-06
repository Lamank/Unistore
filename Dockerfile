FROM python:3.10.8-alpine3.16

RUN apk update && apk add --no-cache && pip install --no-cache --upgrade pip

WORKDIR /app

COPY src/requirements.txt /app/requirements.txt

RUN pip install --no-cache --requirement /app/requirements.txt

COPY . /app

RUN src/manage.py collectstatic
